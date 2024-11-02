# POSTECH SOAT - MICROSERVICES

Examples of how to deploy microservices applications, using API Gateways for intermediation.

## Tools

- Kong;
- Swagger;
- Docker;
- Python;
- Primate;

## For main.1.py

Building:

```bash
docker build -t estoque .
```

Running:

```bash
docker run -p 8080:8080 -it estoque
```

## For main.2.py

```bash
docker compose build
```

```bash
docker compose up
```
