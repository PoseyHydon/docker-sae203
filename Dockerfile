FROM debian:latest
RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
    
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -O /usr/bin/env
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
    
RUN chmod a+rx /usr/local/bin/yt-dlp
RUN hash -r

CMD yt-dlp -o '/home/etudiant/ty211246/git/docker-sae203' 'https://www.youtube.com/watch?v=H9aC5AGY9YU'
