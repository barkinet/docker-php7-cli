FROM ubuntu:15.10

MAINTAINER Patsura Dmitry <talk@dmtry.me>

RUN apt-get update

RUN apt-get install -y git
    libcurl4-openssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    libjpeg-dev \
    libjpeg62 \
    libfreetype6-dev \
    libmysqlclient-dev \
    libt1-dev \
    libgmp-dev \
    libpspell-dev \
    libicu-dev \
    librecode-dev \
    curl \
    make \
    autoconf \
    build-essential \
    g++ \
    libc6-dev

RUN cd /opt && git clone -b php-7.0.0RC5 https://github.com/php/php-src.git --depth=1

RUN cd /opt/php-src && ./buildconf --force

RUN cd /opt/php-src && ./configure --quiet \
    --prefix=/opt/php-nightly

RUN cd /opt/php-src && make --quiet && make install

ENTRYPOINT ["/bin/bash"]
