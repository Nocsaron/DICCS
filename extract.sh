#!/bin/bash

if [ ! $# -eq 1 ]; then
    echo "Usage: extract.sh [FILE]"
    exit
fi;

if [ ! -f $1 ]; then
    echo "File not found!"
    exit
fi;

i=0
xmin=""
xmax=""
ymin=""
ymax=""
zone=""
while read line
do
    if [ $i -eq 26 ]; then
        xmin=$line
    elif [ $i -eq 27 ]; then
        xmax=$line
    elif [ $i -eq 28 ]; then
        ymin=$line
    elif [ $i -eq 29 ]; then
        ymax=$line
    elif [ $i -eq 9 ]; then
        zone=$line
    fi;
((i++))
done < $1


#echo $zone
epsg=${zone##*G: }
epsg=${epsg%%]*}
xmin=${xmin##*: }
xmax=${xmax##*: }
ymin=${ymin##*: }
ymax=${ymax##*: }
zone=${zone##*UTM }
zone=${zone%% *}
zone=${zone:1}
zlet=${zone:2}
zone=${zone%?}
#echo "XMIN: $xmin"
#echo "XMAX: $xmax"
#echo "YMIN: $ymin"
#echo "YMAX: $ymax"
#echo "ZONE: $zone"
#echo "ZONE LETTER: $zlet"
echo "EPSG:$epsg"
