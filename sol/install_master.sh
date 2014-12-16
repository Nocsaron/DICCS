#!/bin/bash
source=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
sudo apt-get -y install git

mkdir $HOME/.sol
mkdir $HOME/.sol/dems
mkdir $HOME/.sol/src
mkdir $HOME/.sol/bin
cp compute.sh $HOME/.sol/src
cp getTiles.sh $HOME/.sol/src
cp init.sh $HOME/.sol/src
cp monthly_sun.mk $HOME/.sol/src
cp EEMT* $HOME/.sol/src
cp sol_master.sh $HOME/.sol/bin
cp sol_worker.sh $HOME/.sol/bin
mkdir $HOME/.cctools-source
cd $HOME/.sol
#Install QGIS, GRASS, GDAL
sudo apt-get -y update
sudo apt-get -y install qgis python-qgis
sudo apt-get -y install qgis-plugin-grass
sudo apt-get -y install grass-dev

#Get and install iCommands
sudo apt-get -y install libssl0.9.8
sudo apt-get -y install python-dev curl help2man libfuse-dev libpam0g-dev libjson-perl
wget ftp://ftp.renci.org/pub/irods/releases/4.0.3/irods-icommands-4.0.3-64bit.deb
sudo dpkg -i irods-icommands-4.0.3-64bit.deb
sudo apt-get -f install
rm  irods-icommands-4.0.3-64bit.deb

#Install R
sudo echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list
sudo apt-get -y update
sudo apt-get -y --force-yes install r-base

#Install R Packages
git clone https://khufkens@bitbucket.org/khufkens/daymetr.git
sudo chmod 777 daymetr
cd daymetr
cp $source/getDaymet.r $HOME/.sol/daymetr
wget http://cran.r-project.org/src/contrib/sp_1.0-16.tar.gz
wget http://cran.r-project.org/src/contrib/rgeos_0.3-8.tar.gz
wget http://cran.r-project.org/src/contrib/rgdal_0.9-1.tar.gz
sudo R CMD INSTALL sp_1.0-16.tar.gz
sudo R CMD INSTALL rgeos_0.3-8.tar.gz
sudo R CMD INSTALL rgdal_0.9-1.tar.gz
sudo R CMD INSTALL DaymetR.tar.gz
rm sp_1.0-16.tar.gz
rm rgeos_0.3-8.tar.gz
rm rgdal_0.9-1.tar.gz


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

cd $HOME/.sol

