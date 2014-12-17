#!/bin/bash

source=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )o

#Install QGIS, GRASS, GDAL
sudo apt-get -y update
sudo apt-get -y install qgis python-qgis
sudo apt-get -y install qgis-plugin-grass
sudo apt-get -y install grass-dev
#Install Makeflow
wget http://ccl.cse.nd.edu/software/files/cctools-4.2.2-source.tar.gz
tar xvzf cctools-4.2.2-source.tar.gz -C $HOME/.cctools-source
rm cctools-4.2.2-source.tar.gz
cd $HOME/.cctools-source/cctools-4.2.2-source
./configure
make
make install
#Add commands to path
echo 'export GISBASE="/usr/lib/grass64"' >> $HOME/.bashrc
echo 'export PATH="$PATH:$GISBASE/bin:$GISBASE/scripts"' >> $HOME/.bashrc
echo 'export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$GISBASE/lib"' >> $HOME/.bashrc
echo "export GISRC=~/.grassrc6" >> $HOME/.bashrc
echo 'export PYTHONPATH="$GISBASE/etc/python"' >> $HOME/.bashrc
echo "export SHELL=/bin/bash" >> $HOME/.bashrc
echo 'export PATH="$PATH:${HOME}/cctools/bin"' >> $HOME/.bashrc
echo 'export PATH="$PATH:${HOME}/.sol/bin"' >> $HOME/.bashrc

#Creat GRASS config file
echo "GISDBASE: $HOME/.sol" >> $HOME/.grassrc6
echo 'LOCATION_NAME: location' >> $HOME/.grassrc6
echo 'MAPSET: PERMANENT' >> $HOME/.grassrc6
echo 'DIGITIZER: none' >> $HOME/.grassrc6
echo 'GRASS_GUI: text' >> $HOME/.grassrc6

grass64 -text
