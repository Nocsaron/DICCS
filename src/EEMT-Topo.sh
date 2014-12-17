#!/bin/bash


# inputs DEM 10m from OpenTopo, 1km DEM from of DAYMET data

# break up the two inputs into monthly inputs to do these calculations

#Locally correct the temperature
r.mapcalc tmin_loc=tmin-0.00649*(dem_10m-dem_1km)
r.mapcalc tmax_loc=tmax-0.00649*(dem_10m-dem_1km)



r.mapcalc total_sun_joules = total_sun*3600

#Make the zero raster
r.mapcalc zeros=if(dem>0,0,null())

#rerun r.sun with the zero raster
r.sun elevin=DEM aspin=zeros slopein=zeros day="1" step="0.05" dist="1" glob_rad=flat_total_sun


#final mapcalc calculation will multiply the ratio of total sun to flat surface
r.mapcalc S_i=total_sun/flat_total_sun
r.mapcalc tmin_topo=tmin_loc+(S_i-(1/S_i))
r.mapcalc tmax_topo=tmax_loc+(S_i-(1/S_i))

#make the PET
r.mapcalc g_psy=0.001013*(101.3*((293-0.00649*dem_10m)/293)^5.26)/(0.622*2.45)
r.mapcalc m_vp=0.04145*exp(0.06088*(tmax_topo+tmin_topo/2))
r.mapcalc ra=(4.72*(ln(2/0.00137))2)/(1+0.536*5)
r.mapcalc vp_loc=6.11*10(7.5*tmin_topo)/(237.3+tmin_topo)
r.mapcalc f_tmin_topo=6.108*exp((17.27*tmin_topo)/(tmin_topo+237.3))
r.mapcalc f_tmax_topo=6.108*exp((17.27*tmax_topo)/(tmax_topo+237.3))
r.mapcalc vp_s_topo=(f_tmax_topo+f_tmin_topo)/2 
r.mapcalc p_a=101325*exp(-9.80665*0.289644*dem_10m/(8.31447*288.15))/287.35*((tmax_topo+tmin_topo/2)273.125)
r.mapcalc PET=total_sun_joules+p_a*0.001013*(vp_s_topo-vp_loc)/ra))/(2.45*(m_vp+g_psy)
r.mapcalc AET=prcp*(1+PET/prcp(1(PET/prcp)2.63)(1/2.63))

#Make the E_ppt
r.mapcalc F=a_i*prcp
r.mapcalc DT=((tmax_topo+tmin_topo)/2) - 273.15
r.mapcalc E_ppt=F*4185.5*DT*E_bio

#Calculate NPP
r.mapcalc N=sin(slope)*cos(aspect*0.0174532925)
r.mapcalc NPP_topo=0.39*dem_10m+346*N-187



#EEMT-Topo = E_bio + E_ppt
