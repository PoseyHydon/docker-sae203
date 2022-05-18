FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    curl \
    wget \
    python \
    locales

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod +rx /usr/local/bin/youtube-dl

RUN youtube-dl /home/etudiant/ty211246/git/docker-sae203 https://www.youtube.com/watch?v=dQw4w9WgXcQ
