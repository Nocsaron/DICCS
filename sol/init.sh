#!/bin/bash

if [ ! $# -eq 3 ]; then
    echo "USAGE: sol_master <DEM> <Metadata> <Year>"
    exit
fi;

dem=$1
meta=$2
year=$3
tile=11371
cd $HOME/.sol/dems
echo "Retrieving NASA DEM"
iget -r /iplant/home/tyson_swetnam/DAYMET/NA_DEM
echo "Retrieving DEM Tiles from DAYMET"
./../src/getTiles.sh $meta $year
if [ ! $? -eq 0 ]; then
   echo "An error occured. Exiting."
   exit
fi;
mv ../daymetr/*.nc .
g.proj -c proj4="+proj=lcc +lat_1=25 +lat_2=60 +lat_0=42.5 +lon_0=-100 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"

gdalwarp -overwrite -s_srs EPSG:26911 -t_srs EPSG:4326 -r bilinear -of GTiff $dem $dem.warped

r.external input=$dem.warped output=warped --overwrite -r
r.external input="NA_DEM/na_dem.tif" output=dem_1km --overwrite -r

#Import tmax
r.external input=tmax_${year}_${tile}.nc band=17 output=tmax_jan --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=47 output=tmax_feb --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=75 output=tmax_march --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=105 output=tmax_april --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=135 output=tmax_may --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=162 output=tmax_june --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=198 output=tmax_july --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=228 output=tmax_aug --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=258 output=tmax_sep --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=288 output=tmax_oct --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=318 output=tmax_nov --overwrite -r
r.external input=tmax_${year}_${tile}.nc band=344 output=tmax_dec --overwrite -r
#Import tmin
r.external input=tmin_${year}_${tile}.nc band=17 output=tmin_jan --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=47 output=tmin_feb --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=75 output=tmin_march --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=105 output=tmin_april --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=135 output=tmin_may --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=162 output=tmin_june --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=198 output=tmin_july --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=228 output=tmin_aug --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=258 output=tmin_sep --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=288 output=tmin_oct --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=318 output=tmin_nov --overwrite -r
r.external input=tmin_${year}_${tile}.nc band=344 output=tmin_dec --overwrite -r
#Import vp
r.external input=vp_${year}_${tile}.nc band=17 output=vp_jan --overwrite -r
r.external input=vp_${year}_${tile}.nc band=47 output=vp_feb --overwrite -r
r.external input=vp_${year}_${tile}.nc band=75 output=vp_march --overwrite -r
r.external input=vp_${year}_${tile}.nc band=105 output=vp_april --overwrite -r
r.external input=vp_${year}_${tile}.nc band=135 output=vp_may --overwrite -r
r.external input=vp_${year}_${tile}.nc band=162 output=vp_june --overwrite -r
r.external input=vp_${year}_${tile}.nc band=198 output=vp_july --overwrite -r
r.external input=vp_${year}_${tile}.nc band=228 output=vp_aug --overwrite -r
r.external input=vp_${year}_${tile}.nc band=258 output=vp_sep --overwrite -r
r.external input=vp_${year}_${tile}.nc band=288 output=vp_oct --overwrite -r
r.external input=vp_${year}_${tile}.nc band=318 output=vp_nov --overwrite -r
r.external input=vp_${year}_${tile}.nc band=344 output=vp_dec --overwrite -r
#Import swe
r.external input=swe_${year}_${tile}.nc band=17 output=swe_jan --overwrite -r
r.external input=swe_${year}_${tile}.nc band=47 output=swe_feb --overwrite -r
r.external input=swe_${year}_${tile}.nc band=75 output=swe_march --overwrite -r
r.external input=swe_${year}_${tile}.nc band=105 output=swe_april --overwrite -r
r.external input=swe_${year}_${tile}.nc band=135 output=swe_may --overwrite -r
r.external input=swe_${year}_${tile}.nc band=162 output=swe_june --overwrite -r
r.external input=swe_${year}_${tile}.nc band=198 output=swe_july --overwrite -r
r.external input=swe_${year}_${tile}.nc band=228 output=swe_aug --overwrite -r
r.external input=swe_${year}_${tile}.nc band=258 output=swe_sep --overwrite -r
r.external input=swe_${year}_${tile}.nc band=288 output=swe_oct --overwrite -r
r.external input=swe_${year}_${tile}.nc band=318 output=swe_nov --overwrite -r
r.external input=swe_${year}_${tile}.nc band=344 output=swe_dec --overwrite -r
#Import srad
r.external input=srad_${year}_${tile}.nc band=17 output=srad_jan --overwrite -r
r.external input=srad_${year}_${tile}.nc band=47 output=srad_feb --overwrite -r
r.external input=srad_${year}_${tile}.nc band=75 output=srad_march --overwrite -r
r.external input=srad_${year}_${tile}.nc band=105 output=srad_april --overwrite -r
r.external input=srad_${year}_${tile}.nc band=135 output=srad_may --overwrite -r
r.external input=srad_${year}_${tile}.nc band=162 output=srad_june --overwrite -r
r.external input=srad_${year}_${tile}.nc band=198 output=srad_july --overwrite -r
r.external input=srad_${year}_${tile}.nc band=228 output=srad_aug --overwrite -r
r.external input=srad_${year}_${tile}.nc band=258 output=srad_sep --overwrite -r
r.external input=srad_${year}_${tile}.nc band=288 output=srad_oct --overwrite -r
r.external input=srad_${year}_${tile}.nc band=318 output=srad_nov --overwrite -r
r.external input=srad_${year}_${tile}.nc band=344 output=srad_dec --overwrite -r
#Import prcp
r.external input=prcp_${year}_${tile}.nc band=17 output=prcp_jan --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=47 output=prcp_feb --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=75 output=prcp_march --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=105 output=prcp_april --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=135 output=prcp_may --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=162 output=prcp_june --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=198 output=prcp_july --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=228 output=prcp_aug --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=258 output=prcp_sep --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=288 output=prcp_oct --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=318 output=prcp_nov --overwrite -r
r.external input=prcp_${year}_${tile}.nc band=344 output=prcp_dec --overwrite -r

echo "Read to Compute!"
