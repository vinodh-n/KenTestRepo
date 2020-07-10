version: '3.7'

services:
  web:
    build: ./src
    command: uvicorn app.main:app --reload --workers 1 --host 0.0.0.0 --port 8000
    volumes:
      - ./src/:/usr/src/app/
    ports:
      - 8002:8000
    environment:
      - DATABASE_URL=postgresql://hello_fastapi:hello_fastapi@db/hello_fastapi_dev
  db:
    image: postgres:12.1-alpine
    volumes:
      - postgres_data:/var/lib/postgresql/data/
    environment:
      - POSTGRES_USER=hello_fastapi
      - POSTGRES_PASSWORD=hello_fastapi