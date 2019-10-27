#!/bin/bash
yum -y install automake libtool flex bison pkgconfig gcc-c++ boost-devel libevent-devel &&\
git clone https://github.com/apache/thrift.git &&\
cd ./thrift && \
./bootstrap.sh && \
./configure \
--with-php \
--with-go \
--without-cpp \
--without-boost \
--without-python \
--without-csharp \
--without-java \
--without-erlang \
--without-perl \
--without-php_extension \
--without-ruby \
--without-haskell \
--without-d \
--without-nodejs \
--without-lua \
&& make \
&& make install \
&& cd .. \
&& rm -rf ./thrift
