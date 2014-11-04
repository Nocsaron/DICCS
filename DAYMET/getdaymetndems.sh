#!/bin/bash

declare -a months=( 'jan' 'feb' 'mar' 'apr' 'may' 'jun' 'jul' 'aug' 'sep' 'oct' 'nov' 'dec' );
this_month=0

mkdir srad_allyrs
cd srad_allyrs
i=0
while [ $i -lt 12 ]; do
     iget -P /iplant/home/tyson_swetnam/DAYMET/srad_allyrs/srad_2012_${months[$i]}.tif
     iget -P /iplant/home/tyson_swetnam/DAYMET/srad_allyrs/srad_2012_${months[$i]}.tif.aux.xml
    ((i++))
done
cd ..

mkdir srvp_allyrs
cd srvp_allyrs
iget -P /iplant/home/tyson_swetnam/DAYMET/srvp_allyrs/2012_srvp.dmvp_tavg.tif
cd ..

mkdir swe_allyrs
cd swe_allyrs
i=0
while [ $i -lt 12 ]; do
     iget -P /iplant/home/tyson_swetnam/DAYMET/swe_allyrs/swe_2012_${months[$i]}.tif
    ((i++))
done
cd ..

mkdir tmax_allyrs
cd tmax_allyrs
i=0
while [ $i -lt 12 ]; do
     iget -P /iplant/home/tyson_swetnam/DAYMET/tmax_allyrs/tmax_2012_${months[$i]}.tif
    ((i++))
done
cd ..

mkdir tmin_allyrs
cd tmin_allyrs
i=0
while [ $i -lt 12 ]; do
     iget -P /iplant/home/tyson_swetnam/DAYMET/tmin_allyrs/tmin_2012_${months[$i]}.tif
    ((i++))
done
cd ..

mkdir vp_allyrs
cd vp_allyrs
i=0
while [ $i -lt 12 ]; do
     iget -P /iplant/home/tyson_swetnam/DAYMET/vp_allyrs/vp_2012_${months[$i]}.tif
    ((i++))
done
cd ..

