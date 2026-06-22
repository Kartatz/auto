#!/bin/bash

INSTALL_PREFIX=/tmp/autotools

wget https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz
tar xf autoconf-*.tar.xz
unlink *.xz
cd autoconf-*

./configure --prefix="${INSTALL_PREFIX}" --host="${CROSS_COMPILE_TRIPLET}"
make
make install

wget https://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.xz
tar xf automake-*.tar.xz
unlink *.xz
cd automake-*

./configure --prefix="${INSTALL_PREFIX}" --host="${CROSS_COMPILE_TRIPLET}"
make
make install
