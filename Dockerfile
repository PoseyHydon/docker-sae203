FROM debian:latest

RUN apt update
RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget \
    configure
    
RUN apt -y install \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev libssl-dev \
    libsqlite3-dev \
    libreadline-dev \
    libffi-dev \
    curl \
    libbz2-dev \
    tar
    
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
RUN tar -xf Python-3.9.1.tgz

RUN cd Python-3.9.1
RUN ./configure --enable-optimizations

RUN make -j 2
RUN make altinstall

RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
    
RUN chmod a+rx /usr/local/bin/yt-dlp
RUN hash -r

CMD yt-dlp -o '/home/etudiant/ty211246/git/docker-sae203' 'https://www.youtube.com/watch?v=H9aC5AGY9YU'
