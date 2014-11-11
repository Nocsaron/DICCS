#January
echo "totalirradiance_january: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=,` output=totalirradiance_january method=median --overwrite" >> series.mf
#February
echo "totalirradiance_february: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(3[2-9]|4[0-9]|5[0-9])" sep=,` output=totalirradiance_february method=median --overwrite" >> series.mf
#March 60-90
echo "totalirradiance_march: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(6[0-9]|7[0-9]|8[0-9]|90)" sep=,` output=totalirradiance_march method=median --overwrite" >> series.mf
#April 91-120
echo "totalirradiance_april: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(9[1-9]|10[0-9]|11[1-9]|120)" sep=,` output=totalirradiance_april method=median --overwrite" >> series.mf
#May 121-151
echo "totalirradiance_may: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(12[1-9]|13[0-9]|14[0-9]|15[0-1])" sep=,` output=totalirradiance_may0 method=median --overwrite" >> series.mf
#June 152-181`
echo "totalirradiance_june: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(15[2-9]|16[0-9]|17[0-9]|18[0-1])" sep=,` output=totalirradiance_june method=median --overwrite" >> series.mf
#Jul 182-212
echo "totalirradiance_july: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`echo " >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(18[2-9]|19[0-9]|20[0-9]|21[0-2])" sep=,` output=totalirradiance_july method=median --overwrite" >> series.mf
#Aug 213-243
echo "totalirradiance_august: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(21[3-9]|22[0-9]|23[0-9]|24[0-3])" sep=,` output=totalirradiance_august method=median --overwrite" >> series.mf
#Sep 244-273 --overwrite
echo "totalirradiance_september: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(24[4-9]|25[0-9]|26[0-9]|27[0-3])" sep=,` output=totalirradiance_september method=median --overwrite" >> series.mf
#Oct 274-304
echo "totalirradiance_october: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(27[4-9]|28[0-9]|29[0-9]|30[0-4])" sep=,` output=totalirradiance_october method=median --overwrite" >> series.mf
#Nov 305-334
echo "totalirradiance_november: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(30[5-9]|31[0-9]|32[0-9]|33[0-4])" sep=,` output=totalirradiance_november method=median --overwrite" >> series.mf
#Dec 335-365
echo "totalirradiance_december: `g.mlist rast pattern="totalirradiance_([1-9]|1[0-92[0-9]|3[0-1])" sep=" "`" >> series.mf
echo "     r.series --quiet input=`g.mlist rast pattern="totalirradiance_(33[5-9]|33[0-9]|34[0-9]|35[0-9]|36[0-5])" sep=,` output=totalirradiance_december method=median --overwrite" >> series.mf

