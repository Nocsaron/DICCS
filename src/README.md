getTiles.sh 
<code>getTiles.sh [OpenTopo Metadata File] [Start Year] [End Year]</code>
----------
<p> getTiles.sh is the first script called in sol.s.  It takes the metadata file of the OpenTopo DEM and reads in the xmin,xman,ymin,and ymax, as well as the epsg/zone data that goes with it.  We then use OpenTopography's LidarPortlet projection.jsp to convert those min's and max's into the lat and long coordinates for each of the corners of the selected projection. Lastly, it gets all the DAYMET data for all the specified years and outputs it into the getDaymet.r file in the dems folder.
run.sh <code>run.sh [OpenTopo DEM]</code>
-----------

<p>run.sh is the meat and potatoes of Sol. 

clean.sh
----------
makeflow_sun.sh
---------------
makeflow_series.sh
------------------
locallycorrectedtemp.sh
-----------------------
