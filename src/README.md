getTiles.sh

----------
run.sh <code>run.sh [OpenTopo DEM]</code>
-----------
<p>run.sh is the meat and potatoes of Sol. Run takes the DEM from OpenTopo and converts it to the Daytum used by DAYMET.  It then proceeds to use GRASS functions to generate the slope and aspect DEMS.  Once slope,aspect, and the warped DEM are created, run then uses them to compute the Solar Irradiance and Irradiation Model for each day in the DAYMET data.  Once the daily data has been computed, Run uses r.series to find the median of each month's respective days to find an average Solar Irradiance and Irradiation Model for the month.</p>
<p>Using the monthly averages, Run then computes the Locally Correct Tempurature.  In the future run will compute all necessary calculations to create an EEMT model.</p>

clean.sh
----------
makeflow_sun.sh
---------------
<p>makeflow_sun.sh is called by run to create the necessary files for makeflow to work correctly.  Specifically this script create the Makeflow files to compute the daily Solar Irradiance and Irradiation Models.</p>

makeflow_series.sh
------------------
<p>makeflow_sun.sh is called by run to create the necessary files for makeflow to work correctly.  Specifically this script create the Makeflow files to compute the monthly Solar Irradiance and Irradiation Model averages.</p>

locallycorrectedtemp.sh <code>locallycorrectedtemp.sh [MONTH]</code>
-----------------------
<p>Note: the argument month must be in the form: january, february, march, april, may, june, july, august, september, october, november, or december</p>
<p>locallycorrectedtemp.sh is the script called by run.sh to compute the Locally Correct Tempurature for the given moneht</p>
