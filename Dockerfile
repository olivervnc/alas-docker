FROM python:3.7-slim-buster

WORKDIR /

RUN apt-get update && apt-get install git adb -y
RUN git clone https://github.com/LmeSzinc/AzurLaneAutoScript

WORKDIR /AzurLaneAutoScript

RUN pip install -r requirements-in.txt --prefer-binary
RUN apk del git musl-dev g++

EXPOSE 22267
COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash","entrypoint.sh"]