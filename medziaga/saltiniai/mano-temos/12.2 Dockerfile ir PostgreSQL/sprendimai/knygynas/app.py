"""Demonstracinė aplikacija: knygų sąrašas (Flask + PostgreSQL). Ne mokinių starteris."""
import os
import time

import psycopg2
from flask import Flask, jsonify, request


def connect():
    return psycopg2.connect(
        host=os.environ.get("DB_HOST", "db"),
        dbname=os.environ.get("DB_NAME", "lab"),
        user=os.environ.get("DB_USER", "lab"),
        password=os.environ["DB_PASSWORD"],
        connect_timeout=3,
    )


def init_db():
    for _ in range(15):
        try:
            with connect() as conn, conn.cursor() as cur:
                cur.execute("CREATE TABLE IF NOT EXISTS knygos (id serial PRIMARY KEY, pavadinimas text NOT NULL)")
            return
        except psycopg2.OperationalError:
            time.sleep(2)
    raise RuntimeError("DB nepasiekiama")


app = Flask(__name__)


@app.get("/health")
def health():
    try:
        with connect() as conn, conn.cursor() as cur:
            cur.execute("SELECT 1")
        return jsonify(status="ok", db="up")
    except psycopg2.Error:
        return jsonify(status="degraded", db="down"), 503


@app.get("/knygos")
def list_books():
    with connect() as conn, conn.cursor() as cur:
        cur.execute("SELECT id, pavadinimas FROM knygos ORDER BY id")
        return jsonify([{"id": i, "pavadinimas": p} for i, p in cur.fetchall()])


@app.post("/knygos")
def add_book():
    pav = (request.get_json(silent=True) or {}).get("pavadinimas", "").strip()
    if not pav:
        return jsonify(klaida="reikia pavadinimo"), 400
    with connect() as conn, conn.cursor() as cur:
        cur.execute("INSERT INTO knygos (pavadinimas) VALUES (%s) RETURNING id", (pav,))
        return jsonify(id=cur.fetchone()[0], pavadinimas=pav), 201


if __name__ != "__main__":
    init_db()
