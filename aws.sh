#!/usr/bin/env bash
SOURCE_DIR=$(cd $(dirname ${BASHS_SOURCE:-$0}) && pwd)
cd ${SOURCE_DIR}
./output/bin/aws $@
