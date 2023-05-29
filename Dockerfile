FROM python:3.7-slim-buster

WORKDIR /

RUN apt-get update && apt-get install git adb libgl1 libglib2.0-0 libsm6 libxrender1 libxext6 libquadmath0 libgomp1 g++ -y
RUN git clone https://github.com/LmeSzinc/AzurLaneAutoScript

WORKDIR /AzurLaneAutoScript

RUN pip install -r requirements-in.txt --prefer-binary && pip cache purge
RUN mv config / && mkdir config
RUN apt-get remove g++ -y && apt-get autoremove

EXPOSE 22267
COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash","entrypoint.sh"]