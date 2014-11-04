#!/bin/bash

#A=dem_10m=warp file=OpenTopo
#B=dem_1Km=na_dem=DAYMET
#B=tmin=DAYMET t min dem

if [ ! $# -eq 1 ]; then
	echo "USAGE: locallycorrectedtemp.sh [MONTH]"
	exit
fi;

month=$1


r.mapcalculator amap=warped bmap=na_dem cmap=tmin.$month formula="C-6.49/1000*(A-B)" outfile=tminloc.$month --overwrite
