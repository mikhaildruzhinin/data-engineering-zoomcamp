FROM python:3.9.1

WORKDIR /app
COPY requirements.txt requirements.txt
COPY scripts/ingest_data.py ingest_data.py 

RUN apt-get install wget
RUN pip install -r requirements.txt
