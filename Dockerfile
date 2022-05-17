FROM debian:latest

RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
    
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz -O /usr/bin/env
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
RUN wget https://yt-dl.org/downloads/latest/youtube-dl.sig -O youtube-dl.sig gpg --verify youtube-dl.sig /usr/local/bin/youtube-dl rm youtube-dl.sig
    
    
RUN chmod a+rx /usr/local/bin/youtube-dl
CMD youtube-dl -o '/home/etudiant/ty211246/git/docker-sae203' 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
CMD youtube-dl -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/user/TheLinuxFoundation/playlists

