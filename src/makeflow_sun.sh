#!/bin/bash

declare -a months=( january february march april may june july august semptember october november december )

echo -n "" > sun.mf

i=1
while [ $i -le 365 ]; do
    echo "totalirradiance_$i: warped aspect slope" >> sun.mf
    echo "     r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i glob_rad=totalirradiance_$i --overwrite" >> sun.mf
    echo "insol_hour_day_$i: warped aspect slope" >> sun.mf
    echo "     r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i insol_time=insol_hour_day_$1 dist=1 --overwrite" >> sun.mf
    ((i++))
done



for m in "${months[@]}"
do
    echo "beamirrad_$m: `g.mlist rast pattern=\"beamirrad_([1-9]|1[0-92[0-9]|3[0-1])\" sep=\" \"`" >> sun.mf
    echo "     r.series --quiet input=`g.mlist rast pattern=\"beamirrad_([1-9]|1[0-92[0-9]|3[0-1])\" sep=,` output=beamirrad_january method=median --overwrite" >> sun.mf
done
