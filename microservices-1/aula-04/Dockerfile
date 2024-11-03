FROM python:3.9-slim-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# COPY main.1.py /app/main.py
COPY main.2.py /app/main.py

EXPOSE 8080

# main:app - main.py file and app object in it
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]