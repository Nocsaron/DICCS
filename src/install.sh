#!/bin/bash

#Install QGIS, GRASS, GDAL
sudo apt-get update
sudo apt-get install qgis python-qgis
sudo apt-get install qgis-plugin-grass
sudo apt-get install grass-dev

#Add commands to path
echo "export GISBASE="/usr/lib/grass64"" >> $HOME/.bashrc
echo 'export PATH="$PATH:$GISBASE/bin:$GISBASE/scripts"' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GISBASE/lib"' >> $HOME/.bashrc
echo "export GISRC=~/.grassrc6" >> $HOME/.bashrc
echo 'export PYTHONPATH="$GISBASE/etc/python"' >> $HOME/.bashrc
echo "export SHELL=/bin/bash" >> $HOME/.bashrc

#Creat GRASS config file
echo 'GISBASE: $HOME/midterm' >> $HOME/.grassrc6
echo 'LOCATION_NAME: location' >> $HOME/.grassrc6
echo 'MAPSET: PERMANENT' >> $HOME/.grassrc6
echo 'DIGITIZER: none' >> $HOME/.grassrc6
echo 'GRASS_GUI: text' >> $HOME/.grassrc6

source ~/.bashrc
