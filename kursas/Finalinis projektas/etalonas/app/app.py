"""Mini platformos etaloninė aplikacija: užrašų API (Flask + PostgreSQL)."""
import os
import socket
import time
from pathlib import Path

from flask import Flask, Response, g, jsonify, request
from prometheus_client import CONTENT_TYPE_LATEST, Counter, Histogram, generate_latest
from sqlalchemy import Column, DateTime, Integer, String, create_engine, func, text
from sqlalchemy.exc import OperationalError
from sqlalchemy.orm import declarative_base, sessionmaker

Base = declarative_base()


class Note(Base):
    __tablename__ = "notes"
    id = Column(Integer, primary_key=True)
    text = Column(String(500), nullable=False)
    created_at = Column(DateTime, server_default=func.now())

    def to_dict(self):
        return {"id": self.id, "text": self.text, "created_at": str(self.created_at)}


INDEX_HTML = (Path(__file__).parent / "static" / "index.html").read_bytes()

# CSP: puslapis yra vienas failas su CSS ir JS viduje (be CDN), todėl reikia 'unsafe-inline'.
# Visa kita uždrausta: jokių išorinių šaltinių, užklausos tik į tą patį origin.
CSP = (
    "default-src 'none'; script-src 'unsafe-inline'; style-src 'unsafe-inline'; "
    "connect-src 'self'; base-uri 'none'; form-action 'none'; frame-ancestors 'none'"
)

REQUESTS = Counter("http_requests_total", "HTTP užklausos", ["method", "endpoint", "status"])
LATENCY = Histogram("http_request_duration_seconds", "Užklausos trukmė", ["endpoint"])


def create_app(database_url=None):
    app = Flask(__name__)
    url = database_url or os.environ.get("DATABASE_URL", "sqlite:///:memory:")
    engine = create_engine(url, pool_pre_ping=True)
    Session = sessionmaker(bind=engine)
    # DB gali pakilti vėliau nei API (Kubernetes): laukiame, o ne kertame
    for attempt in range(30):
        try:
            Base.metadata.create_all(engine)
            break
        except OperationalError:
            if attempt == 29:
                raise
            time.sleep(2)

    @app.before_request
    def _start():
        g.start = time.time()

    @app.after_request
    def _record(resp):
        endpoint = request.url_rule.rule if request.url_rule else "unknown"
        REQUESTS.labels(request.method, endpoint, resp.status_code).inc()
        LATENCY.labels(endpoint).observe(time.time() - g.get("start", time.time()))
        return resp

    @app.get("/")
    def index():
        resp = Response(INDEX_HTML, mimetype="text/html")
        resp.headers["Content-Security-Policy"] = CSP
        resp.headers["X-Content-Type-Options"] = "nosniff"
        return resp

    @app.get("/api/info")
    def info():
        """Tik aplinkos vardas, vaizdo versija ir pod'o vardas - jokių paslapčių."""
        return jsonify(
            env=os.environ.get("APP_ENV", "unknown"),
            version=os.environ.get("APP_VERSION", "unknown"),
            hostname=socket.gethostname(),
        )

    @app.get("/health")
    def health():
        """Gyvybingumas + DB pasiekiamumas (naudojama probes ir patikrinimo skripte)."""
        try:
            with engine.connect() as conn:
                conn.execute(text("SELECT 1"))
        except Exception:
            return jsonify(status="degraded", db="down"), 503
        return jsonify(status="ok", db="up")

    @app.get("/notes")
    def list_notes():
        with Session() as s:
            return jsonify([n.to_dict() for n in s.query(Note).order_by(Note.id).all()])

    @app.post("/notes")
    def add_note():
        data = request.get_json(silent=True) or {}
        text_value = (data.get("text") or "").strip()
        if not text_value or len(text_value) > 500:
            return jsonify(error="text privalomas (1-500 simbolių)"), 400
        with Session() as s:
            note = Note(text=text_value)
            s.add(note)
            s.commit()
            s.refresh(note)
            return jsonify(note.to_dict()), 201

    @app.get("/metrics")
    def metrics():
        return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

    return app


# gunicorn app:app
app = create_app() if os.environ.get("DATABASE_URL") else None
