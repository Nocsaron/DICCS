#!/bin/bash

#Install QGIS, GRASS, GDAL
sudo apt-get -y update
sudo apt-get -y install qgis python-qgis
sudo apt-get -y install qgis-plugin-grass
sudo apt-get -y install grass-dev

#Get and install iCommands
sudo apt-get -y install libssl0.9.8

#Install R
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get install r-base

#Install R Packages
cd ../daymetr
sudo R CMD INSTALL sp_1.0-16.tar.gz
sudo R CMD INSTALL rgeo_0.3-8.tar.gz
sudo R CMD INSTALL rgdal_0.9-1.tar.gz
sudo R CMD INSTALL DaymetR.tar.gz



#Add commands to path
echo "export GISBASE="/usr/lib/grass64"" >> $HOME/.bashrc
echo 'export PATH="$PATH:$GISBASE/bin:$GISBASE/scripts"' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GISBASE/lib"' >> $HOME/.bashrc
echo "export GISRC=~/.grassrc6" >> $HOME/.bashrc
echo 'export PYTHONPATH="$GISBASE/etc/python"' >> $HOME/.bashrc
echo "export SHELL=/bin/bash" >> $HOME/.bashrc

#Creat GRASS config file
echo 'GISDBASE: $HOME/midterm' >> $HOME/.grassrc6
echo 'LOCATION_NAME: location' >> $HOME/.grassrc6
echo 'MAPSET: PERMANENT' >> $HOME/.grassrc6
echo 'DIGITIZER: none' >> $HOME/.grassrc6
echo 'GRASS_GUI: text' >> $HOME/.grassrc6

source ~/.bashrc
