FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
    
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -O /usr/bin/env
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp


COPY ./test.sh /root/
    
RUN chmod a+rx /usr/local/bin/yt-dlp
RUN hash -r

RUN chmod +x /root/test.sh 
CMD ["/bin/bash", "/root/test.sh"]
