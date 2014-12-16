#!/bin/bash

src=$HOME/.sol/src

./$src/init.sh $1 $2 $3
./$src/compute.sh
