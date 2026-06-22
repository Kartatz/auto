#!/bin/bash

declare -r workdir="${PWD}"

INSTALL_PREFIX=/tmp/autotools

cp "${workdir}/submodules/obggcc/tools/ln.sh" '/tmp/ln'
export PATH="/tmp:${PATH}"

wget 'https://sourceforge.net/projects/tcl/files/Tcl/9.0.4/tcl9.0.4rc0-src.tar.gz'
tar xf tcl*.tar.gz
unlink *.gz
cd tcl*/unix

./configure --prefix="${INSTALL_PREFIX}" --host="${CROSS_COMPILE_TRIPLET}"
make
make install

cd "${workdir}"

wget 'https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz'
tar xf autoconf-*.tar.xz
unlink *.xz
cd autoconf-*

./configure --prefix="${INSTALL_PREFIX}" --host="${CROSS_COMPILE_TRIPLET}"
make
make install

cd "${workdir}"

wget 'https://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.xz'
tar xf automake-*.tar.xz
unlink *.xz
cd automake-*

./configure --prefix="${INSTALL_PREFIX}" --host="${CROSS_COMPILE_TRIPLET}"
make
make install

cd "${workdir}"

wget 'https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz'
tar xf expect*.tar.gz
unlink *.gz
cd expect*

./configure --prefix="${INSTALL_PREFIX}" --exec-prefix="${INSTALL_PREFIX}"
make
make install

cd "${workdir}"

wget 'https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.3.tar.gz'
tar xf dejagnu-*.tar.gz
unlink *.gz
cd dejagnu-*

./configure --prefix="${INSTALL_PREFIX}" --host="${CROSS_COMPILE_TRIPLET}"
make
make install
