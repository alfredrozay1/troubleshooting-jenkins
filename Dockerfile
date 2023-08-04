FROM python:slim-bullseye
ENV PYTHONUNBUFFERED 1 
COPY . /app 
WORKDIR /app 
CMD python3 server.py