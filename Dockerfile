FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    curl -L https://yt-dl.org/downloads/latest/youtube-dl
    
    
RUN chmod a+rx youtube-dl
RUN youtube-dl https://www.youtube.com/watch?v=dQw4w9WgXcQ
