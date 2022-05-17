FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget https://github.com/ytdl-org/youtube-dl/releases/tag/2021.12.17
    
    
RUN chmod a+rx youtube-dl
RUN youtube-dl https://www.youtube.com/watch?v=dQw4w9WgXcQ
