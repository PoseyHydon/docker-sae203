FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
    
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -O /usr/bin/env
RUN wget https://github.com/ytdl-org/youtube-dl/releases/download/2021.12.17/youtube-dl-2021.12.17.tar.gz -O /usr/local/bin/youtube-dl
    
    
RUN chmod a+rx /usr/local/bin/youtube-dl
RUN youtube-dl -o ~ https://www.youtube.com/watch?v=dQw4w9WgXcQ
