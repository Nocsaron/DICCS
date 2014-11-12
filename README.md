sol.sh
-------

Sol is a distributed computation program capable of combining OpenTopography Lidar data and DAYMET weather data to compute an Effective Energy to Mass Trasfer DEM.  Sol uses GRASS GIS, R, and DaymetR behind the scenes to perform computation.  Because this computation is computationally difficult, Sol uses Makeflow and WorkQueue to distribute the workload across as many systems as desired.

Installation
-------------
Pre-Installation Requirements:
    Ubuntu Operating System

Instructions:
  On a ubuntu system of your choice (Openstack preffered) download the Sol program to your home directory.
  Run 
      <code>"sudo ./install.sh</code>

Executing
---------
Once installed simply run Sol from the DICCS directory, giving it the path to your OpenTopo DEM, and OpenTopo Metadata File

Note:  Currently Sol only works if you add workers.  In the future Sol will give you the option to be massively distributed or not.

To add workers, on any machine with Makeflow/Workqueue installed run <code>work_queue_worker -N ACIC -p 5550</code> as many times as workers as you want.  We recommend 1 worker per processing core. 
