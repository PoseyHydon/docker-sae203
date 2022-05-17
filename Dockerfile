FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
    
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -O /usr/bin/env
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
    
    
RUN chmod a+rx /usr/local/bin/youtube-dl
CMD youtube-dl "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
