#GeoConvert
wget http://sf.net/projects/geographiclib/files/distrib/GeographicLib-1.38.tar.gz

#gdalwarp
 gdalwarp -overwrite -s_srs EPSG:26911 -t_srs EPSG:4326 -r bilinear -of GTiff /home/posideon/professional/ista/midterm/OpenTopo/southern_sierra_nevad/output.tin.tif /home/posideon/professional/ista/midterm/output2
