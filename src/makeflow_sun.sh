#!/bin/bash

declare -a months=( january february march april may june july august semptember october november december )

echo -n "" > sun.mf
days=5
i=1
while [ $i -le $days ]; do
    echo "totalirradiance_$i: ../location/PERMANENT/cell/warped  ../location/PERMANENT/cell/aspect  ../location/PERMANENT/cell/slope" >> sun.mf
    echo "     r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i glob_rad=totalirradiance_$i --overwrite; r.out.gdal input=totalirradiance_$i out=./totalirradiance_$i" >> sun.mf
#    echo "~/DICCS/location/PERMANENT/cell/insol_hour_day_$i:  ../location/PERMANENT/cell/warped  ../location/PERMANENT/cell/aspect  ../location/PERMANENT/cell/slope" >> sun.mf
#    echo "     r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i insol_time=insol_hour_day_$i dist=1 --overwrite" >> sun.mf
    ((i++))
done
