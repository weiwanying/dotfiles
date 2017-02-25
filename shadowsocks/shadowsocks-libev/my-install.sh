#!/bin/bash
#################################################################
#   Copyright (C) 2017 Sean Guo. All rights reserved.
#
#   > File Name:        < 0.prerequisites.sh >
#   > Author:           < Sean Guo >
#   > Mail:             < iseanxp+code@gmail.com >
#   > Created Time:     < 2017/02/25 >
#   > Description:
#################################################################
#https://github.com/shadowsocks/shadowsocks-libev
#https://cokebar.info/archives/767

# Get the latest source code
git clone https://github.com/shadowsocks/shadowsocks-libev.git
cd shadowsocks-libev
git submodule update --init --recursive

# Build and install with recent mbedTLS and libsodium
export LIBSODIUM_VER=1.0.11
export MBEDTLS_VER=2.4.0
wget https://github.com/jedisct1/libsodium/releases/download/1.0.11/libsodium-$LIBSODIUM_VER.tar.gz
tar xvf libsodium-$LIBSODIUM_VER.tar.gz
pushd libsodium-$LIBSODIUM_VER
./configure --prefix=/usr && make
sudo make install
popd
wget https://tls.mbed.org/download/mbedtls-$MBEDTLS_VER-gpl.tgz
tar xvf mbedtls-$MBEDTLS_VER-gpl.tgz
pushd mbedtls-$MBEDTLS_VER
make SHARED=1 CFLAGS=-fPIC
sudo make DESTDIR=/usr install
popd

# Fedora & RHEL
yum install epel-release -y
yum install gcc gettext autoconf libtool automake make pcre-devel asciidoc xmlto udns-devel libev-devel -y

# compile and install
./autogen.sh && ./configure && make
sudo make install
cd ../

mkdir -p /etc/shadowsocks-libev/
cp config.json /etc/shadowsocks-libev/
cd /etc/init.d/
wget https://raw.githubusercontent.com/shadowsocks/shadowsocks-libev/master/rpm/SOURCES/etc/init.d/shadowsocks-libev
/etc/init.d/shadowsocks-libev start
