sol.sh
-------

Sol is a distributed computation program capable of combining OpenTopography Lidar data and DAYMET weather data to compute an Effective Energy to Mass Trasfer DEM.  Sol uses GRASS GIS, R, and DaymetR behind the scenes to perform computation.  Because this computation is computationally difficult, Sol uses Makeflow and WorkQueue to distribute the workload across as many systems as desired.

Installation
-------------
Pre-Installation Requirements:
    Debain Operating System

Instructions:
  On a ubuntu system of your choice download the Sol program to your home directory.
    
To install Sol Master Node run:  
```
sudo ./install_master.sh
source ~/.bashrc
iinit
grass64
```

To install Sol Worker Nodes run:
```
sudo ./install_worker.sh
source ~/.bashrc
grass64
```

The initialization parameters for iinit are:

| Item        | Value       |
|:-----------:|:-----------:|
| Host Server | data.iplantcollaborative.com       |
| Port | 1247 |
| Username | `<your iplant username>` |
| Password | `<Your iplant passsord>` |

To initialize the grass location first run <code>grass64</code>
```
<ESC><ENTER>
y
y
D
y
<Enter a 1 line description here>y
y
lcc
y
wgs84
<ENTER>
<ENTER>
<ESC><ENTER>
y
<ENTER>
<ESC><ENTER>
exit
```



    
Executing
---------
To run the master node simply call <code>`sol_master.sh <DEM> <Metadata> Year`</code>, giving it the path to your OpenTopo DEM, and OpenTopo Metadata File and the year you wish to compute.

To automatically run a Sol Worker call <code>sol_worker.sh</code> for as many workers as you desire. (Note: Exceeding the number of cores you have is highly unrecommended.

To add workers, on any machine with Makeflow/Workqueue installed run <code>work_queue_worker -N ACIC3 -p 5550</code> as many times as workers as you want.  We recommend 1 worker per processing core. 
