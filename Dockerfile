FROM debian:latest

RUN apt update
RUN  apt-get update && \
    apt-get -y install  \
    apache2 \
    wget
   

RUN set -x && \
    TEMP_PACKAGES=() && \
    KEPT_PACKAGES=() && \
    # Packages only required during build
    TEMP_PACKAGES+=(git) && \
    TEMP_PACKAGES+=(make) && \
    TEMP_PACKAGES+=(pandoc) && \
    # Packages kept in the image
    KEPT_PACKAGES+=(bash) && \
    TEMP_PACKAGES+=(build-essential) && \
    KEPT_PACKAGES+=(ca-certificates) && \
    KEPT_PACKAGES+=(ffmpeg) && \
    KEPT_PACKAGES+=(locales) && \
    KEPT_PACKAGES+=(locales-all) && \
    KEPT_PACKAGES+=(mpv) && \
    KEPT_PACKAGES+=(python3) && \
    TEMP_PACKAGES+=(python3-dev) && \
    KEPT_PACKAGES+=(python-is-python3) && \
    KEPT_PACKAGES+=(python3-pip) && \
    KEPT_PACKAGES+=(rtmpdump) && \
    KEPT_PACKAGES+=(zip) && \
    KEPT_PACKAGES+=(atomicparsley) && \
    KEPT_PACKAGES+=(aria2) && \
    # Install packages
    apt-get update -y && \
    apt-get install -y --no-install-recommends \
        ${KEPT_PACKAGES[@]} \
        ${TEMP_PACKAGES[@]} \
        && \
    git config --global advice.detachedHead false && \
    # Install required python modules
    python3 -m pip install --no-cache-dir pyxattr && \
    # Install yt-dlp via pip
    python3 -m pip install --no-cache-dir --force-reinstall yt-dlp && \
    # Create /config directory
    mkdir -p /config && \
    # Clean-up
    apt-get remove -y ${TEMP_PACKAGES[@]} && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /src && \
