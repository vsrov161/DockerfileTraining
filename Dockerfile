FROM python:3.12-slim AS builder
LABEL authors="Vic Sergeev"
WORKDIR /app

COPY requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt

FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /root/.local /home/appuser/.local

COPY . .

ENV PATH=/home/appuser.local/bin:$PATH

USER appuser

EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

ENTRYPOINT ["python"]
CMD["main.py"]