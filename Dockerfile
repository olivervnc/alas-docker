FROM python:3.7-alpine

WORKDIR /

RUN apk add --no-cache git bash musl-dev g++ adb
RUN git clone https://github.com/LmeSzinc/AzurLaneAutoScript

WORKDIR /AzurLaneAutoScript

RUN pip install -r requirements-in.txt --prefer-binary
RUN apk del git musl-dev g++

EXPOSE 22267
COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash","entrypoint.sh"]