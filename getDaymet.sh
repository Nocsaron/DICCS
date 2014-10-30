#!/bin/bash

if [ ! $# -eq 2 ]; then
    echo "Usage: getdaymet [lat] [long]"
    exit
fi;

lat=$1
long=$2
year="2013"

echo $lat
echo $long

wget -O $year "http://daymet.ornl.gov/data/send/saveData?lat=$lat&lon=$long&year=2012,2013"

