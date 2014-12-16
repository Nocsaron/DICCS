#!/bin/bash

if [ ! $# -eq 2 ]; then
    echo "Usage: getTiles.sh [OpenTopo Metadata File] [Year]"
    exit
fi; 

if [ ! -f $1 ]; then
    echo "ERROR: File not found! Exiting"
    exit
fi;

#Extract the mins, maxes, and epsg from metadata file

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

#Convert x/y min/max to lat long corners of new projections
wget -q -O coordinates "http://opentopo.sdsc.edu/LidarPortlet/jsp/projection.jsp?minx=$xmin&miny=$ymin&maxx=$xmax&maxy=$ymax&inEpsg=$epsg&outEpsg=4326"

lat1=`cut -d'|' -f1 coordinates`
lon1=`cut -d'|' -f2 coordinates`
lat2=`cut -d'|' -f3 coordinates`
lon2=`cut -d'|' -f4 coordinates`

lat1=$(echo "$lat1" | sed "s/\n//g" | sed "s/\r//g")
lon1=$(echo "$lon1" | sed "s/\n//g" | sed "s/\r//g")
lat2=$(echo "$lat2" | sed "s/\n//g" | sed "s/\r//g")
lon2=$(echo "$lon2" | sed "s/\n//g" | sed "s/\r//g")

cd ../daymetr
Rscript getDaymet.r $lon1 $lat1 NA NA $2 $2 "ALL" ../dems/
