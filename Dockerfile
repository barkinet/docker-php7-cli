FROM ubuntu:15.10

MAINTAINER Patsura Dmitry, talk@dmtry.me

RUN apt-get update

RUN apt-get build-dep -y php5 && apt-get install -y \
    git \
    make \
    autoconf \
    build-essential \
    g++ \
    libc6-dev

RUN cd /opt && git clone https://github.com/php/php-src.git --depth=1

RUN cd /opt/php-src && ./buildconf --force

RUN cd /opt/php-src && ./configure --quiet \
    --prefix=/opt/php-nightly

RUN cd /opt/php-src && make --quiet

#RUN cd /opt/php-src && make install

RUN cp /opt/php-src/sapi/cli/php /usr/local/bin/php

ENTRYPOINT ["/bin/bash"]
