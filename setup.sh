#!/usr/bin/env bash

SOURCE_DIR=$(cd $(dirname ${BASHS_SOURCE:-$0}) && pwd)
cd ${SOURCE_DIR}

rm -r config.log config.status Makefile build output
./configure --prefix=$PWD/output --with-download-deps --with-install-type=system-sandbox
make
make install
