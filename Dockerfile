FROM debian:latest

WORKDIR /mydir

RUN  apt-get update && \
    apt-get -y install  \
    curl \
    wget \
    python \
    locales

RUN curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
RUN chmod +rx /usr/local/bin/youtube-dl

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

COPY ./test.sh /root/

RUN chmod +x /root/test.sh
CMD ["/bin/bash", "/root/test.sh"]
