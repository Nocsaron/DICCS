#!/bin/bash

if [ ! $# -eq 1 ]; then
	echo "USAGE: averagedailydems.sh [FILEPREFIX]"
	echo "    Filenames must be format: FILEPREFIX.###"
	exit
fi;

prefix=$1

echo "Finding median of months for $1 rasters"
#January
r.series --quiet input=`g.mlist rast pattern="$prefix.([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=$prefix.january method=median --overwrite
#February
r.series --quiet input=`g.mlist rast pattern="$prefix.(3[2-9]|4[0-9]|5[0-9])" sep=,` output=$prefix.february method=median --overwrite
#March 60-90
r.series --quiet input=`g.mlist rast pattern="$prefix.(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=$prefix.march method=median --overwrite
#April 91-120
r.series --quiet input=`g.mlist rast pattern="$prefix.(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=$prefix.april method=median --overwrite
#May 121-151
r.series --quiet input=`g.mlist rast pattern="$prefix.(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=$prefix.may method=median --overwrite
#June 152-181`
r.series --quiet input=`g.mlist rast pattern="$prefix.(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=$prefix.june method=median --overwrite
#Jul 182-212
r.series --quiet input=`g.mlist rast pattern="$prefix.(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=$prefix.july method=median --overwrite
#Aug 213-243
r.series --quiet input=`g.mlist rast pattern="$prefix.(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=$prefix.august method=median --overwrite
#Sep 244-273
r.series --quiet input=`g.mlist rast pattern="$prefix.(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=$prefix.september method=median --overwrite
#Oct 274-304
r.series --quiet input=`g.mlist rast pattern="$prefix.(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=$prefix.october method=median --overwrite
#Nov 305-334
r.series --quiet input=`g.mlist rast pattern="$prefix.(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=$prefix.november method=median --overwrite
#Dec 335-365
r.series --quiet input=`g.mlist rast pattern="$prefix.(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=$prefix.december method=median --overwrite

echo "Raster medians completed."
echo "Removing daily rasters"

g.mremove --quiet -f rast="$prefix.[0-9]*"
