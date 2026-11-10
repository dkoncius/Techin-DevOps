# --- 1 etapas: priklausomybių surinkimas ---
FROM python:3.12-slim AS build
WORKDIR /w
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# --- 2 etapas: galutinis atvaizdas (be kompiliatorių, ne root) ---
FROM python:3.12-slim
RUN useradd --uid 10001 --no-create-home --shell /usr/sbin/nologin appuser
COPY --from=build /install /usr/local
WORKDIR /srv
COPY app.py .
COPY static ./static
USER 10001
ENV PYTHONUNBUFFERED=1
EXPOSE 8000
HEALTHCHECK --interval=15s --timeout=3s --retries=3 \
  CMD python -c "import urllib.request;urllib.request.urlopen('http://127.0.0.1:8000/health')"
CMD ["gunicorn", "-b", "0.0.0.0:8000", "-w", "2", "app:app"]
