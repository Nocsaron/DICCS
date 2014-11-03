#!/bin/bash

#eemt.sh [OpenTopo DEM] [OpenTopo Metadata] [DAYMET file]

if [ ! $# -eq 3 ]; then
    echo "Usage: eem.sh [OpenTopo DEM] [OpenTopo Metadata] [DAYMET data]"
    exit
fi;

ot=$1
daymet=$2
s_srs=$(./extract.sh $2)
t_srs="EPSG:4326"

#warp
gdalwarp -overwrite -s_srs $s_srs -t_srs $t_srs -r bilinear -of GTiff $1 test_output
#gdalinfo test_output
#slope/aspect
#g.mapsets -l




#r.slope.aspect
r.in.gdal input=test_output output=raster
r.slope.aspect elevation=raster slope=test_slope aspect=test_aspect
#sun
#run r.sun using the aspect and slope files.

i=1
while [ $i -le 32 ]; do
    r.sun elevin=raster aspin=test_aspect slopein=test_slope step=0.05 day=$i glob_rad=totalirradiance_$i refl_rad=groundreflected_$i diff_rad=diffuseirrad_$i beam_rad=beamirrad_$i 
    ((i++))
done


r.series input=`g.mlist rast pattern="beamirrad_([1-9]|1[0-92[0-9]|3[0-1])"` output=beamirrad_january
