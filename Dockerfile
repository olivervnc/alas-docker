FROM python:3.7-slim

WORKDIR /

RUN apt-get update && apt-get install git -y

RUN git clone https://github.com/LmeSzinc/AzurLaneAutoScript

WORKDIR /AzurLaneAutoScript

RUN pip install -r requirements.txt
RUN pip cache purge

EXPOSE 22267
COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash","entrypoint.sh"]