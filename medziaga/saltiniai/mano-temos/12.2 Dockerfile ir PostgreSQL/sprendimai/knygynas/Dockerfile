# 1 etapas: priklausomybių įdiegimas
FROM python:3.12-slim AS build
WORKDIR /w
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# 2 etapas: galutinis atvaizdas, tik programa ir bibliotekos, ne root
FROM python:3.12-slim
RUN useradd --uid 10001 --no-create-home --shell /usr/sbin/nologin appuser
COPY --from=build /install /usr/local
WORKDIR /srv
COPY app.py .
USER 10001
ENV PYTHONUNBUFFERED=1
EXPOSE 8000
CMD ["gunicorn", "-b", "0.0.0.0:8000", "-w", "2", "app:app"]
