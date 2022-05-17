FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
    
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
    
    
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN youtube-dl https://www.youtube.com/watch?v=dQw4w9WgXcQ
