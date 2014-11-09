#!/bin/bash

if [ ! $# -eq 1 ]; then
    echo "USAGE: run.sh [OpenTopo DEM]"
    exit
fi;

opentopodem=$1

#Set projection
g.proj -c proj4="+proj=lcc +lat_1=25 +lat_2=60 +lat_0=42.5 +lon_0=-100 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"

#Warp OpenTopo to valid projection
gdalwarp -overwrite -s_srs EPSG:26911 -t_srs "+proj=lcc +lat_1=25 +lat_2=60 +lat_0=42.5 +lon_0=-100 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs" -r bilinear -of GTiff ../dems/$opentopodem ../dems/output.den.tif.warped


#Import OpenTopo-warped Raster
r.external input="../dems/output.den.tif.warped" output=warped --overwrite -r

#Set region to new raster
g.region rast=warped

#Run Slope/Aspect
r.slope.aspect elevation=warped slope=slope aspect=aspect --overwrite

#Compute Sun Values for all days and average into months
./sun.sh

#Import and average DAYMET DEMS
echo "Importing daily DAYMET DEMs"

#echo "Importing National DEM"
#r.external input="../dems/na_dem/na_dem.tif" band=1 output=na_dem --overwrite -r

declare -a files=( dayl prcp srad swe tmax tmin vp )
for f in "${files[@]}"
do
	r.external input="../dems/$f.nc" output=$f --overwrite --quiet -r
	./averagedailytiles.sh $f 
done

#Generic Variables for mapcal
declare -a months=( january february march april may june july august september october november december )

#Compute Locally Corrected Temperature
for m in "${months[@]}"
do
	./locallycorrectedtemp.sh $m
done
