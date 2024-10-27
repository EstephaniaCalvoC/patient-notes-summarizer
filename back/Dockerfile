FROM python:3.11-slim

WORKDIR /code

COPY requirements.txt .
COPY ./notes_api .

RUN apt update && \
    apt install -y python3-dev default-libmysqlclient-dev build-essential pkg-config && \
    pwd && \
    ls -la && \
    pip install -r requirements.txt


EXPOSE 8080

CMD ["python", "notes_api/manage.py", "runserver", "0.0.0.0:8080"]