FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    curl \
    wget \
    python \
    locales

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod +rx /usr/local/bin/youtube-dl

RUN youtube-dl https://www.youtube.com/watch?v=dQw4w9WgXcQ
