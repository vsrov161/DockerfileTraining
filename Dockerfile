FROM python:3.12-slim AS builder
LABEL authors="Vic Sergeev"
WORKDIR /app

# install system dependencies for compile(optional)
RUN apt-get install update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# install to system dir
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.12-slim

# intsalling curl for healthcheck
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd -r appuser && useradd -r -g appuser appuser

WORKDIR /app

# cloning dependencies from builder
COPY --from=builder /usr/local/lib/python3.12/site-packages /user/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# copy source code
COPY --chown=appuser:appuser . .
USER appuser
EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

CMD ["main.py"]
