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

#r.slope.aspect
r.in.gdal input=test_output output=raster --overwrite
r.slope.aspect elevation=raster slope=slope aspect=aspect --overwrite
#sun
echo "Computing r.sun...."
i=1
while [ $i -le 365 ]; do
    r.sun --quiet elevin=raster aspin=aspect slopein=slope step=0.05 day=$i glob_rad=totalirradiance_$i refl_rad=groundreflected_$i diff_rad=diffuseirrad_$i beam_rad=beamirrad_$i insol_time=insol_hour_day dist=1 --overwrite
    ((i++))
done

#BEAMIRRAD
#January
r.series input=`g.mlist rast pattern="beamirrad_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=beamirrad_january method=median --overwrite
#February
r.series input=`g.mlist rast pattern="beamirrad_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=beamirrad_february method=median --overwrite
#March 60-90
r.series input=`g.mlist rast pattern="beamirrad_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=beamirrad_march method=median --overwrite
#April 91-120
r.series input=`g.mlist rast pattern="beamirrad_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=beamirrad_april method=median --overwrite
#May 121-151
r.series input=`g.mlist rast pattern="beamirrad_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=beamirrad_may0 method=median --overwrite
#June 152-181`
r.series input=`g.mlist rast pattern="beamirrad_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=beamirrad_june method=median --overwrite
#Jul 182-212
r.series input=`g.mlist rast pattern="beamirrad_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=beamirrad_july method=median --overwrite
#Aug 213-243
r.series input=`g.mlist rast pattern="beamirrad_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=beamirrad_august method=median --overwrite

#Sep 244-273
r.series input=`g.mlist rast pattern="beamirrad_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=beamirrad_september method=median --overwrite
#Oct 274-304
r.series input=`g.mlist rast pattern="beamirrad_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=beamirrad_october method=median --overwrite
#Nov 305-334
r.series input=`g.mlist rast pattern="beamirrad_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=beamirrad_november method=median --overwrite
#Dec 335-365
r.series input=`g.mlist rast pattern="beamirrad_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=beamirrad_december method=median --overwrite


#BEAMIRRAD
#January
r.series input=`g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=totalirradiance_january method=median --overwrite
#February
r.series input=`g.mlist rast pattern="totalirradiance_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=totalirradiance_february method=median --overwrite
#March 60-90
r.series input=`g.mlist rast pattern="totalirradiance_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=totalirradiance_march method=median --overwrite
#April 91-120
r.series input=`g.mlist rast pattern="totalirradiance_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=totalirradiance_april method=median --overwrite
#May 121-151
r.series input=`g.mlist rast pattern="totalirradiance_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=totalirradiance_may0 method=median --overwrite
#June 152-181`
r.series input=`g.mlist rast pattern="totalirradiance_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=totalirradiance_june method=median --overwrite
#Jul 182-212
r.series input=`g.mlist rast pattern="totalirradiance_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=totalirradiance_july method=median --overwrite
#Aug 213-243
r.series input=`g.mlist rast pattern="totalirradiance_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=totalirradiance_august method=median --overwrite

#Sep 244-273 --overwrite
r.series input=`g.mlist rast pattern="totalirradiance_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=totalirradiance_september method=median --overwrite
#Oct 274-304
r.series input=`g.mlist rast pattern="totalirradiance_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=totalirradiance_october method=median --overwrite
#Nov 305-334
r.series input=`g.mlist rast pattern="totalirradiance_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=totalirradiance_november method=median --overwrite
#Dec 335-365
r.series input=`g.mlist rast pattern="totalirradiance_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=totalirradiance_december method=median --overwrite

#BEAMIRRAD --overwrite
#January
r.series input=`g.mlist rast pattern="groundreflected_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=groundreflected_january method=median --overwrite
#February
r.series input=`g.mlist rast pattern="groundreflected_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=groundreflected_february method=median --overwrite
#March 60-90
r.series input=`g.mlist rast pattern="groundreflected_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=groundreflected_march method=median --overwrite
#April 91-120
r.series input=`g.mlist rast pattern="groundreflected_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=groundreflected_april method=median --overwrite
#May 121-151
r.series input=`g.mlist rast pattern="groundreflected_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=groundreflected_may0 method=median --overwrite
#June 152-181`
r.series input=`g.mlist rast pattern="groundreflected_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=groundreflected_june method=median --overwrite
#Jul 182-212
r.series input=`g.mlist rast pattern="groundreflected_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=groundreflected_july method=median --overwrite
#Aug 213-243
r.series input=`g.mlist rast pattern="groundreflected_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=groundreflected_august method=median --overwrite

#Sep 244-273
r.series input=`g.mlist rast pattern="groundreflected_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=groundreflected_september method=median --overwrite
#Oct 274-304
r.series input=`g.mlist rast pattern="groundreflected_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=groundreflected_october method=median --overwrite
#Nov 305-334
r.series input=`g.mlist rast pattern="groundreflected_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=groundreflected_november method=median --overwrite
#Dec 335-365
r.series input=`g.mlist rast pattern="groundreflected_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=groundreflected_december method=median --overwrite

#DiffuseIRRAd --overwrite
#January
r.series input=`g.mlist rast pattern="diffuseirrad_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=diffuseirrad_january method=median --overwrite
#February
r.series input=`g.mlist rast pattern="diffuseirrad_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=diffuseirrad_february method=median --overwrite
#March 60-90
r.series input=`g.mlist rast pattern="diffuseirrad_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=diffuseirrad_march method=median --overwrite
#April 91-120
r.series input=`g.mlist rast pattern="diffuseirrad_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=diffuseirrad_april method=median --overwrite
#May 121-151
r.series input=`g.mlist rast pattern="diffuseirrad_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=diffuseirrad_may0 method=median --overwrite
#June 152-181`
r.series input=`g.mlist rast pattern="diffuseirrad_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=diffuseirrad_june method=median --overwrite
#Jul 182-212
r.series input=`g.mlist rast pattern="diffuseirrad_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=diffuseirrad_july method=median --overwrite
#Aug 213-243
r.series input=`g.mlist rast pattern="diffuseirrad_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=diffuseirrad_august method=median --overwrite

#Sep 244-273 --overwrite
r.series input=`g.mlist rast pattern="diffuseirrad_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=diffuseirrad_september method=median --overwrite
#Oct 274-304
r.series input=`g.mlist rast pattern="diffuseirrad_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=diffuseirrad_october method=median --overwrite
#Nov 305-334
r.series input=`g.mlist rast pattern="diffuseirrad_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=diffuseirrad_november method=median --overwrite
#Dec 335-365
r.series input=`g.mlist rast pattern="diffuseirrad_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=diffuseirrad_december method=median --overwrite

#Cleanup
g.mremove -f rast=*_[0-9]*
