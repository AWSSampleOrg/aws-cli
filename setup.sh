#!/usr/bin/env bash
SOURCE_DIR=$(cd $(dirname ${BASHS_SOURCE:-$0}) && pwd)
AWS_CLI_DIRECTORY=${SOURCE_DIR}/aws-cli

cd ${SOURCE_DIR}

function main(){
    cp -r ${SOURCE_DIR}/analyze ${AWS_CLI_DIRECTORY}
    cp ${SOURCE_DIR}/aws.sh ${AWS_CLI_DIRECTORY}
    cp ${SOURCE_DIR}/bin/aws ${AWS_CLI_DIRECTORY}/bin/aws

    cd ${AWS_CLI_DIRECTORY}

    git branch
    ls configure
    if [ $? -ne 0 ] ; then
        YELLOW='\033[33m'
        COLOR_END='\033[0m'
        echo -e "${YELLOW}Use specific version of AWS CLI. You can switch branch to the following or older versions than them.${COLOR_END}"
        if [ $(uname) = 'Darwin' ] ; then
            git tag -l --sort=v:refname | tail -n 10 -r
            cd ${SOURCE_DIR}
            . ${SOURCE_DIR}/cleanup.sh
            return
        fi

        which tac
        if [ $? -eq 0 ] ; then
            git tag -l --sort=v:refname | tac | head -n 10
            cd ${SOURCE_DIR}
            . ${SOURCE_DIR}/cleanup.sh
            return
        fi
    fi

    rm -rf config.log config.status Makefile build output
    ./configure --prefix=$PWD/output --with-download-deps --with-install-type=system-sandbox
    make
    make install

    echo "" >> .gitignore
    echo output >> .gitignore
    echo output.log >> .gitignore
}

main
