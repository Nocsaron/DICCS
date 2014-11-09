#!/bin/bash

declare -a months=( january february march april may june july august semptember october november december )

echo -n "" > r.series.out

for m in "${months[@]}"
do
    echo "beamirrad_$m: `g.mlist rast pattern=\"beamirrad_([1-9]|1[0-92[0-9]|3[0-1])\" sep=\" \"`" >> r.series.out
    echo "     r.series --quiet input=`g.mlist rast pattern=\"beamirrad_([1-9]|1[0-92[0-9]|3[0-1])\" sep=,` output=beamirrad_january method=median --overwrite" >> r.series.out
done
