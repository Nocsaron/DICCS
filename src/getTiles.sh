#!/bin/bash

if [ ! $# -eq 2 ]; then
	echo "USAGE: getTiles.sh [YEAR] [TILE]"
	exit
fi;


year=$1
tile=$2


#thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1219/tiles/YEAR/TILE_YEAR/[FILES]

declare -a files=( dayl prcp srad swe tmax tmin vp )

cd ../dems
for f in "${files[@]}" 
do
	wget thredds.daac.ornl.gov/thredds/fileServer/ornldaac/1219/tiles/$year/"$tile"_"$year"/$f.nc
done
cd -
