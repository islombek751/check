#!/bin/bash
source venv/bin/activate
export $(cat .env | xargs)

exec gunicorn src.main:app \
    --workers 2 \
    --worker-class uvicorn.workers.UvicornWorker \
    --bind 127.0.0.1:8000 \
    --timeout 120