import pytest

from app import create_app


@pytest.fixture()
def client():
    app = create_app("sqlite:///:memory:")
    return app.test_client()


def test_health(client):
    r = client.get("/health")
    assert r.status_code == 200
    assert r.get_json()["status"] == "ok"


def test_add_and_list(client):
    r = client.post("/notes", json={"text": "labas"})
    assert r.status_code == 201
    r = client.get("/notes")
    assert [n["text"] for n in r.get_json()] == ["labas"]


def test_validation(client):
    assert client.post("/notes", json={"text": ""}).status_code == 400
    assert client.post("/notes", json={}).status_code == 400


def test_metrics(client):
    client.get("/health")
    r = client.get("/metrics")
    assert r.status_code == 200
    assert b"http_requests_total" in r.data


def test_index_page(client):
    r = client.get("/")
    assert r.status_code == 200
    assert r.mimetype == "text/html"
    assert "Etalonas" in r.get_data(as_text=True)
    assert "innerHTML" not in r.get_data(as_text=True)
    assert "default-src 'none'" in r.headers["Content-Security-Policy"]


def test_info_fields(client, monkeypatch):
    monkeypatch.setenv("APP_ENV", "local")
    monkeypatch.setenv("APP_VERSION", "sha-abc1234")
    data = client.get("/api/info").get_json()
    assert set(data) == {"env", "version", "hostname"}
    assert data["env"] == "local"
    assert data["version"] == "sha-abc1234"
    assert data["hostname"]


def test_info_defaults(client, monkeypatch):
    monkeypatch.delenv("APP_ENV", raising=False)
    monkeypatch.delenv("APP_VERSION", raising=False)
    data = client.get("/api/info").get_json()
    assert data["env"] == "unknown"
    assert data["version"] == "unknown"


def test_index_ui_markers(client):
    html = client.get("/").get_data(as_text=True)
    for marker in ("Pastabų dar nėra.", "DB veikia", "DB neveikia", "Pastaba pridėta"):
        assert marker in html
    assert "http://" not in html and "https://" not in html
