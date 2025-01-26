#!/usr/bin/env bash

v=$1
cat ./output.log | awk '
    BEGIN{
        FS = "\t";
        OFS = "\t"
    }
    $4 == "line" {
        if($7 ~ /'$v'/) {
            print $1, $2 ":" $3, $4, $5, $6, $7
        }
    }
'
