#!/usr/bin/env bash
SOURCE_DIR=$(cd $(dirname ${BASHS_SOURCE:-$0}) && pwd)
AWS_CLI_DIRECTORY=${SOURCE_DIR}/aws-cli

cd ${AWS_CLI_DIRECTORY}

rm -rf config.log config.status Makefile aws.sh build output output.log analyze
git reset --hard
git checkout develop
