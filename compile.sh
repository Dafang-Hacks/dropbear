#!/usr/bin/env bash
TOOLCHAIN=$(pwd)/../toolchain/bin
CROSS_COMPILE=$TOOLCHAIN/mips-linux-gnu-
export CC=${CROSS_COMPILE}gcc
export LD=${CROSS_COMPILE}ld
export CFLAGS="-muclibc -O2 -DDEBUG_TRACE -DFAKE_ROOT "
export CPPFLAGS="-muclibc -O2"
export LDFLAGS="-muclibc -O2"


make clean
./configure --host=mips-linux --disable-zlib
make PROGRAMS="dropbear dbclient scp dropbearkey dropbearconvert" MULTI=1 SCPPROGRESS=1
