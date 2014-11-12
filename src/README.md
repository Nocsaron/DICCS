getTiles.sh [OpenTopo Metadata File] [Start Year] [End Year]
----------
<p> getTiles.sh is the first script called in sol.s.  It takes the metadata file of the OpenTopo DEM and reads in the xmin,xman,ymin,and ymax, as well as the epsg/zone data that goes with it.  We then use OpenTopography's LidarPortlet projection.jsp to convert those min's and max's into the lat and long coordinates for each of the corners of the selected projection. Lastly, it gets all the DAYMET data for all the specified years and outputs it into the getDaymet.r file in the dems folder.

run.sh [OpenTopo DEM]
-----------
<p>run.sh is the meat and potatoes of Sol. Run takes the DEM from OpenTopo and converts it to the Daytum used by DAYMET. It then proceeds to use GRASS functions to generate the slope and aspect DEMS. Once slope,aspect, and the warped DEM are created, run then uses them to compute the Solar Irradiance and Irradiation Model for each day in the DAYMET data. Once the daily data has been computed, Run uses r.series to find the median of each month's respective days to find an average Solar Irradiance and Irradiation Model for the month.</p>

<p>Using the monthly averages, Run then computes the Locally Correct Tempurature. In the future run will compute all necessary calculations to create an EEMT model.</p>

clean.sh
----------

makeflow_sun.sh
---------------
makeflow_sun.sh is called by run to create the necessary files for makeflow to work correctly. Specifically this script create the Makeflow files to compute the daily Solar Irradiance and Irradiation Models.

makeflow_series.sh
------------------
makeflow_series.sh is called by run to create the necessary files for makeflow to work correctly. Specifically this script create the Makeflow files to compute the monthly Solar Irradiance and Irradiation Model averages.

locallycorrectedtemp.sh [MONTH]
-----------------------

Note: the argument month must be in the form: january, february, march, april, may, june, july, august, september, october, november, or december

locallycorrectedtemp.sh is the script called by run.sh to compute the Locally Correct Tempurature for the given moneht
