#!/bin/bash

if [ ! $# -eq 4 ]; then
    echo "USAGE: sol [opentopo dem] [opentopo metadata] [start year] [end year]"
    exit
fi;

opentopodem=$1
metadata=$2
syear=$3
eyear=$4

cd src
echo "Retrieving DEM Tiles from DAYMET"
./getTiles.sh $metadata $syear $eyear

echo "Starting Computation...."
./run.sh $opentopodem
