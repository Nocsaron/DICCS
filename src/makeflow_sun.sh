#!/bin/bash

declare -a months=( january february march april may june july august semptember october november december )

echo -n "" > sun.mf
days=1
i=1
while [ $i -le 1 ]; do
    echo "~/DICCS/location/PERMANENT/cell/totalirradiance_$i a.out: ../location/PERMANENT/cell/warped  ../location/PERMANENT/cell/aspect  ../location/PERMANENT/cell/slope" >> sun.mf
    echo "     r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i glob_rad=totalirradiance_$i --overwrite --v >a.out" >> sun.mf
    echo "~/DICCS/location/PERMANENT/cell/insol_hour_day_$i:  ../location/PERMANENT/cell/warped  ../location/PERMANENT/cell/aspect  ../location/PERMANENT/cell/slope" >> sun.mf
    echo "     r.sun elevin=warped aspin=aspect slopein=slope step=0.05 day=$i insol_time=insol_hour_day_$i dist=1 --overwrite" >> sun.mf
    ((i++))
done

echo -n "~/DICCS/dems/sun_files.tar.gz: a.out " >> sun.mf
i=1
#while [ $i -le 1 ]; do
#	echo -n "~/DICCS/location/PERMANENT/cell/totalirradiance_$i ~/DICCS/location/PERMANENT/cell/insol_hour_day_$i " >> sun.mf
#	((i++))
#done
echo "" >> sun.mf
echo "     sudo tar-zcf ~/DICCS/dems/sun_files.tar.gz ~/DICCS/location/PERMANENT/cell > ~/tar.out" >> sun.mf
