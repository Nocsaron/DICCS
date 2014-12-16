#!/bin/bash

if [ ! $# -eq 4 ]; then
    echo "FAIL"
    exit
fi;

src=$HOME/.sol/src

./../src/init.sh $1 $2 $3
./../src/compute.sh
