#!/bin/bash

cd $HOME/.sol/src

projectname=ACIC3
port=5550

r.slope.aspect elevation=warped slope=slope aspect=aspect --overwrite

echo "Distributing solar insulation computations"
makeflow -T wq monthly_sun.mk -N $projectname -p $port

#for each month import tmin, tmax, prcp

declare -a months=( jan feb march april may june july aug sept oct nov dec )

for m in "${months[@]}"
do
    ./EEMT-Trad.sh $m
    ./EEMT-Topo.sh $m
done

r.out.gdal input=eemt_trad output=eemt_trad
r.out.gdal input=eemt_topo output=eemt_topo

tar -cvzf eemt.tar.gz eemt_trad eemt_topo
echo "EEMT Topo and EEMT Trad created"
