#!/bin/bash

month=$1


# inputs DEM 10m from OpenTopo, 1km DEM from of DAYMET data

# break up the two inputs into monthly inputs to do these calculations

#Locally correct the temperature
r.mapcalc tmin_loc=tmin_${month}-0.00649*(dem_10m-dem_1km)
r.mapcalc tmax_loc=tmax_${month}-0.00649*(dem_10m-dem_1km)


r.mapcalc f_tmin_loc=6.108*exp((17.27*tmin_loc)/(tmin_loc+273.3))
r.mapcalc f_tmax_loc=6.108*exp((17.27*tmax_loc)/(tmax_loc+273.3))
r.mapcalc vp_s=(f_tmax_loc+f_tmin_loc)/2
r.mapcalc PET=(2.1*((hours_sun/12)^2)*vp_s/((tmax_loc+tmin_loc)/2)
r.mapcalc E_ppt=monthly_prcp - PET


#Calculate the E_bio
r.mapcalc NPP_trad=3000*(1+exp(1.315-0.119*(tmax_loc+tmin_loc)/2)^-1)
r.mapcalc E_bio=NPP_trad*(22*10^6)


#EEMT-Trad = E_bio + E_ppt
