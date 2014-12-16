#!/bin/bash

if [ ! $# -eq 3 ]; then
    echo "USAGE: sol_master <DEM> <Metadata> <Year>"
    exit
fi;

dem=$1
meta=$2
year=$3

cd $HOME/.sol/dems
echo "Retrieving NASA DEM"
iget iget -r /iplant/home/tyson_swetnam/DAYMET/NA_DEM
echo "Retrieving DEM Tiles from DAYMET"
./../src/getTiles.sh $meta $year
if [ ! $? -eq 0 ]; then
   echo "An error occured. Exiting."
   exit
fi;

g.proj -c proj4="+proj=lcc +lat_1=25 +lat_2=60 +lat_0=42.5 +lon_0=-100 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"

gdalwarp -overwrite -s_srs EPSG:26911 -t_srs EPSG:4326 -r bilinear -of GTiff $dem $dem.warped

r.external input=$dem.warped output=warped --overwrite -r
r.external input="NA_DEM/na_dem.tif" output=dem_1km --overwrite -r

echo "Read to Compute!"
