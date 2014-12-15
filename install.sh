#!/bin/bash

printf "function on_usr ()\n{\nsource ~/.bashrc\n}\ntrap on_usr SIGUSR1\n" >> $HOME/.bashrc
#Install QGIS, GRASS, GDAL
sudo apt-get -y update
sudo apt-get -y install qgis python-qgis
sudo apt-get -y install qgis-plugin-grass
sudo apt-get -y install grass-dev

#Get and install iCommands
sudo apt-get -y install libssl0.9.8
sudo apt-get -y install python-dev curl help2man libfuse-dev libpam0g-dev libjson-perl
#git clone https://github.com/irods/irods.git
#./irods/packaging/build.sh icommands
wget ftp://ftp.renci.org/pub/irods/releases/4.0.3/irods-icommands-4.0.3-64bit.deb
sudo dpkg -i irods-icommands-4.0.3-64bit.deb
sudo apt-get -f install

#Install R
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y --force-yes install r-base

#Install R Packages
cd daymetr
sudo R CMD INSTALL sp_1.0-16.tar.gz
sudo R CMD INSTALL rgeos_0.3-8.tar.gz
sudo R CMD INSTALL rgdal_0.9-1.tar.gz
sudo R CMD INSTALL DaymetR.tar.gz

#Install Makeflow
wget http://ccl.cse.nd.edu/software/files/cctools-4.2.2-source.tar.gz
tar xvzf cctools-4.2.2-source.tar.gz
cd cctools-4.2.2-source
./configure 
make
make install
cd ..
rm cctools-4.2.2-source.tar.gz

#Add commands to path
echo 'export GISBASE="/usr/lib/grass64"' >> $HOME/.bashrc
echo 'export PATH="$PATH:$GISBASE/bin:$GISBASE/scripts"' >> $HOME/.bashrc 
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GISBASE/lib"' >> $HOME/.bashrc
echo "export GISRC=~/.grassrc6" >> $HOME/.bashrc
echo 'export PYTHONPATH="$GISBASE/etc/python"' >> $HOME/.bashrc
echo "export SHELL=/bin/bash" >> $HOME/.bashrc
echo 'export PATH="$PATH:${HOME}/cctools/bin"' >> $HOME/.bashrc
#echo "export PATH=$PATH:`pwd`" >> $HOME/.bashrc


#printf "function on_usr ()\n{\nsource ~/.bashrc\n}\ntrap on_usr SIGUSR1\n" >> $GOME/.bashrc


#Creat GRASS config file
echo "GISDBASE: `pwd`" >> $HOME/.grassrc6
echo 'LOCATION_NAME: location' >> $HOME/.grassrc6
echo 'MAPSET: PERMANENT' >> $HOME/.grassrc6
echo 'DIGITIZER: none' >> $HOME/.grassrc6
echo 'GRASS_GUI: text' >> $HOME/.grassrc6


source $HOME/.bashrc
kill -USR1 $PPID
