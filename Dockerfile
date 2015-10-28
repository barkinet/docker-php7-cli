FROM ubuntu:15.10

MAINTAINER Patsura Dmitry <talk@dmtry.me>

ENV PHP_VERSION 7.0.0RC6

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    re2c \
    bison \
    ca-certificates \
    git \
    libssl-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libmcrypt-dev \
    libxml2-dev \
    libjpeg-dev \
    libjpeg62 \
    libfreetype6-dev \
    libmysqlclient-dev \
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


RUN cd /opt && curl -SL "https://downloads.php.net/~ab/php-$PHP_VERSION.tar.xz" -o php.tar.xz \
	&& mkdir -p /opt/php-src \
	&& tar -xof php.tar.xz -C /opt/php-src --strip-components=1

RUN cd /opt/php-src \
    && ./buildconf --force \
    && ./configure --quiet \
        --disable-cgi \
        --with-curl \
        --prefix=/opt/php7 \
    && make -j"$(nproc)" --quiet \
    && make install

ENTRYPOINT ["/bin/bash"]
