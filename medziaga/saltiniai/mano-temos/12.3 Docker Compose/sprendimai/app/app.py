import os

import psycopg2
from flask import Flask, jsonify, request

app = Flask(__name__)


def connect():
    # DATABASE_URL: postgresql+psycopg2://user:pass@db:5432/name
    url = os.environ["DATABASE_URL"].replace("postgresql+psycopg2://", "postgresql://")
    return psycopg2.connect(url, connect_timeout=3)


@app.get("/health")
def health():
    try:
        with connect() as conn, conn.cursor() as cur:
            cur.execute("SELECT 1")
        return jsonify(status="ok", db="up")
    except Exception:
        return jsonify(status="error", db="down"), 503


@app.route("/notes", methods=["GET", "POST"])
def notes():
    with connect() as conn, conn.cursor() as cur:
        cur.execute("CREATE TABLE IF NOT EXISTS notes (id serial PRIMARY KEY, text text NOT NULL)")
        if request.method == "POST":
            cur.execute("INSERT INTO notes (text) VALUES (%s) RETURNING id", (request.get_json()["text"],))
            return jsonify(id=cur.fetchone()[0]), 201
        cur.execute("SELECT id, text FROM notes ORDER BY id")
        return jsonify([{"id": i, "text": t} for i, t in cur.fetchall()])
