#!/bin/bash

echo "Computing r.sun...."
echo "Computing daily rasters"
i=1
while [ $i -le 365 ]; do
	r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i glob_rad=totalirradiance_$i refl_rad=groundreflected_$i diff_rad=diffuseirrad_$i beam_rad=beamirrad_$i insol_time=insol_hour_day dist=1 --overwrite
	((i++))
done

echo "Daily sun rasters computed.  Averaging for months"

#Take the individual sun output files and average them into individual months
#BEAMIRRAD
#January
r.series --quiet input=`g.mlist rast pattern="beamirrad_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=beamirrad_january method=median --overwrite
#February
r.series --quiet input=`g.mlist rast pattern="beamirrad_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=beamirrad_february method=median --overwrite
#March 60-90
r.series --quiet input=`g.mlist rast pattern="beamirrad_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=beamirrad_march method=median --overwrite
#April 91-120
r.series --quiet input=`g.mlist rast pattern="beamirrad_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=beamirrad_april method=median --overwrite
#May 121-151
r.series --quiet input=`g.mlist rast pattern="beamirrad_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=beamirrad_may0 method=median --overwrite
#June 152-181`
r.series --quiet input=`g.mlist rast pattern="beamirrad_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=beamirrad_june method=median --overwrite
#Jul 182-212
r.series --quiet input=`g.mlist rast pattern="beamirrad_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=beamirrad_july method=median --overwrite
#Aug 213-243
r.series --quiet input=`g.mlist rast pattern="beamirrad_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=beamirrad_august method=median --overwrite
#Sep 244-273
r.series --quiet input=`g.mlist rast pattern="beamirrad_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=beamirrad_september method=median --overwrite
#Oct 274-304
r.series --quiet input=`g.mlist rast pattern="beamirrad_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=beamirrad_october method=median --overwrite
#Nov 305-334
r.series --quiet input=`g.mlist rast pattern="beamirrad_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=beamirrad_november method=median --overwrite
#Dec 335-365
r.series --quiet input=`g.mlist rast pattern="beamirrad_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=beamirrad_december method=median --overwrite


#TotalIrradiance
#January
r.series --quiet input=`g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=totalirradiance_january method=median --overwrite
#February
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=totalirradiance_february method=median --overwrite
#March 60-90
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=totalirradiance_march method=median --overwrite
#April 91-120
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=totalirradiance_april method=median --overwrite
#May 121-151
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=totalirradiance_may0 method=median --overwrite
#June 152-181`
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=totalirradiance_june method=median --overwrite
#Jul 182-212
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=totalirradiance_july method=median --overwrite
#Aug 213-243
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=totalirradiance_august method=median --overwrite
#Sep 244-273 --overwrite
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=totalirradiance_september method=median --overwrite
#Oct 274-304
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=totalirradiance_october method=median --overwrite
#Nov 305-334
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=totalirradiance_november method=median --overwrite
#Dec 335-365
r.series --quiet input=`g.mlist rast pattern="totalirradiance_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=totalirradiance_december method=median --overwrite

#GroundReflected --overwrite
#January
r.series --quiet input=`g.mlist rast pattern="groundreflected_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=groundreflected_january method=median --overwrite
#February
r.series --quiet input=`g.mlist rast pattern="groundreflected_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=groundreflected_february method=median --overwrite
#March 60-90
r.series --quiet input=`g.mlist rast pattern="groundreflected_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=groundreflected_march method=median --overwrite
#April 91-120
r.series --quiet input=`g.mlist rast pattern="groundreflected_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=groundreflected_april method=median --overwrite
#May 121-151
r.series --quiet input=`g.mlist rast pattern="groundreflected_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=groundreflected_may0 method=median --overwrite
#June 152-181`
r.series --quiet input=`g.mlist rast pattern="groundreflected_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=groundreflected_june method=median --overwrite
#Jul 182-212
r.series --quiet input=`g.mlist rast pattern="groundreflected_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=groundreflected_july method=median --overwrite
#Aug 213-243
r.series --quiet input=`g.mlist rast pattern="groundreflected_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=groundreflected_august method=median --overwrite
#Sep 244-273
r.series --quiet input=`g.mlist rast pattern="groundreflected_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=groundreflected_september method=median --overwrite
#Oct 274-304
r.series --quiet input=`g.mlist rast pattern="groundreflected_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=groundreflected_october method=median --overwrite
#Nov 305-334
r.series --quiet input=`g.mlist rast pattern="groundreflected_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=groundreflected_november method=median --overwrite
#Dec 335-365
r.series --quiet input=`g.mlist rast pattern="groundreflected_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=groundreflected_december method=median --overwrite

#DiffuseIRRAd --overwrite
#January
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=diffuseirrad_january method=median --overwrite
#February
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=diffuseirrad_february method=median --overwrite
#March 60-90
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=diffuseirrad_march method=median --overwrite
#April 91-120
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=diffuseirrad_april method=median --overwrite
#May 121-151
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=diffuseirrad_may0 method=median --overwrite
#June 152-181`
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=diffuseirrad_june method=median --overwrite
#Jul 182-212
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=diffuseirrad_july method=median --overwrite
#Aug 213-243
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=diffuseirrad_august method=median --overwrite
#Sep 244-273 --overwrite
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=diffuseirrad_september method=median --overwrite
#Oct 274-304
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=diffuseirrad_october method=median --overwrite
#Nov 305-334
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=diffuseirrad_november method=median --overwrite
#Dec 335-365
r.series --quiet input=`g.mlist rast pattern="diffuseirrad_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=diffuseirrad_december method=median --overwrite

echo "Monthly sun rasters averaged. Cleaning up daily files..."

g.mremove --quiet -f rast=*_[0-9]*

echo "Cleanup complete"
echo "Sun completed"
