FROM python:3.7-alpine

WORKDIR /

RUN apk add --no-cache git bash
RUN git clone https://github.com/LmeSzinc/AzurLaneAutoScript

WORKDIR /AzurLaneAutoScript

RUN pip install -r requirements-in.txt

EXPOSE 22267
COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash","entrypoint.sh"]