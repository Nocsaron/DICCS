#!/bin/bash

#eemt.sh [OpenTopo DEM] [OpenTopo Metadata] [DAYMET file]

if [ ! $# -eq 3 ]; then
    echo "Usage: eem.sh [OpenTopo DEM] [DAYMET data]"
    exit
fi;

ot=$1
daymet=$2
s_srs=$(./extract.sh $2)
t_srs="EPSG:4326"

#warp
gdalwarp -overwrite -s_srs $s_srs -t_srs $t_srs -r bilinear -of GTiff $1 test_output
#slope/aspect
#r.slope.aspect
#sun
#run r.sun using the aspect and slope files.
#this need to be run for each month
