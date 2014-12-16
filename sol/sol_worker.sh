#!/bin/bash

#if [ ! $# -eq 2 ]; then
#    echo "USAGE: sol_worker <Project Name> <Port #>"
#    exit
#fi;

project=ACIC3
port=5550

work_queue_worker -N $project -p $port
