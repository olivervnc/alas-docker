FROM python:3.7-alpine

WORKDIR /

RUN apk add --no-cache git bash pkgconfig ffmpeg-libswresample ffmpeg-libswscale ffmpeg-libavfilter ffmpeg-libavutil ffmpeg-libavdevice ffmpeg-libavcodec ffmpeg-libavformat

WORKDIR /AzurLaneAutoScript

RUN pip install -r requirements.txt
RUN pip cache purge

EXPOSE 22267
COPY entrypoint.sh ./
ENTRYPOINT ["/bin/bash","entrypoint.sh"]