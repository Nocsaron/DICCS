irrad_jan insol_time_jan: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=17 glob_rad=irrad_jan insol_time=insol_time_jan --overwrite; r.out.gdal input=irrad_jan out=./irrad_jan; r.out.gdal input=insol_time_jan out=./insol_time_jan; 
irrad_feb insol_time_feb: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=47 glob_rad=irrad_feb insol_time=insol_time_feb --overwrite; r.out.gdal input=irrad_feb out=./irrad_feb; r.out.gdal input=insol_time_feb out=./insol_time_feb; 
irrad_march insol_time_march: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=75 glob_rad=irrad_march insol_time=insol_time_march --overwrite; r.out.gdal input=irrad_march out=./irrad_march; r.out.gdal input=insol_time_march out=./insol_time_march; 
irrad_april insol_time_april: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=105 glob_rad=irrad_april insol_time=insol_time_april --overwrite; r.out.gdal input=irrad_april out=./irrad_april; r.out.gdal input=insol_time_april out=./insol_time_april; 
irrad_may insol_time_may: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=135 glob_rad=irrad_may insol_time=insol_time_may --overwrite; r.out.gdal input=irrad_may out=./irrad_may; r.out.gdal input=insol_time_may out=./insol_time_may; 
irrad_june insol_time_june: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=162 glob_rad=irrad_june insol_time=insol_time_june --overwrite; r.out.gdal input=irrad_june out=./irrad_june; r.out.gdal input=insol_time_june out=./insol_time_june; 
irrad_july insol_time_july: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=198 glob_rad=irrad_july insol_time=insol_time_july --overwrite; r.out.gdal input=irrad_july out=./irrad_july; r.out.gdal input=insol_time_july out=./insol_time_july; 
irrad_aug insol_time_aug: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=228 glob_rad=irrad_aug insol_time=insol_time_aug --overwrite; r.out.gdal input=irrad_aug out=./irrad_aug; r.out.gdal input=insol_time_aug out=./insol_time_aug; 
irrad_sep insol_time_sep: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=258 glob_rad=irrad_sep insol_time=insol_time_sep --overwrite; r.out.gdal input=irrad_sep out=./irrad_sep; r.out.gdal input=insol_time_sep out=./insol_time_sep; 
irrad_oct insol_time_oct: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=288 glob_rad=irrad_oct insol_time=insol_time_oct --overwrite; r.out.gdal input=irrad_oct out=./irrad_oct; r.out.gdal input=insol_time_oct out=./insol_time_oct; 
irrad_nov insol_time_nov: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=318 glob_rad=irrad_nov insol_time=insol_time_nov --overwrite; r.out.gdal input=irrad_nov out=./irrad_nov; r.out.gdal input=insol_time_nov out=./insol_time_nov; 
irrad_dec insol_time_dec: ../location/PERMANENT/cell/warped ../location/PERMANENT/cell/aspect ../location/PERMANENT/cell/slope
	r.sun elevin=warped aspin=aspect slopein=slope step=.05 day=344 glob_rad=irrad_dec insol_time=insol_time_dec --overwrite; r.out.gdal input=irrad_dec out=./irrad_dec; r.out.gdal input=insol_time_dec out=./insol_time_dec; 
../location/PERMANENT/cell/irrad_jan ../location/PERMANENT/cell/insol_time_jan: irrad_jan insol_time_jan
	LOCAL r.external input="irrad_jan" output=irrad_jan --overwrite -r; r.external input="insol_time_jan" output=insol_time_jan --overwrite -r;
../location/PERMANENT/cell/irrad_feb ../location/PERMANENT/cell/insol_time_feb: irrad_feb insol_time_feb
	LOCAL r.external input="irrad_feb" output=irrad_feb --overwrite -r; r.external input="insol_time_feb" output=insol_time_feb --overwrite -r;
../location/PERMANENT/cell/irrad_march ../location/PERMANENT/cell/insol_time_march: irrad_march insol_time_march
	LOCAL r.external input="irrad_march" output=irrad_march --overwrite -r; r.external input="insol_time_march" output=insol_time_march --overwrite -r;
../location/PERMANENT/cell/irrad_april ../location/PERMANENT/cell/insol_time_april: irrad_april insol_time_april
	LOCAL r.external input="irrad_april" output=irrad_april --overwrite -r; r.external input="insol_time_april" output=insol_time_april --overwrite -r;
../location/PERMANENT/cell/irrad_may ../location/PERMANENT/cell/insol_time_may: irrad_may insol_time_may
	LOCAL r.external input="irrad_may" output=irrad_may --overwrite -r; r.external input="insol_time_may" output=insol_time_may --overwrite -r;
../location/PERMANENT/cell/irrad_june ../location/PERMANENT/cell/insol_time_june: irrad_june insol_time_june
	LOCAL r.external input="irrad_june" output=irrad_june --overwrite -r; r.external input="insol_time_june" output=insol_time_june --overwrite -r;
../location/PERMANENT/cell/irrad_july ../location/PERMANENT/cell/insol_time_july: irrad_july insol_time_july
	LOCAL r.external input="irrad_july" output=irrad_july --overwrite -r; r.external input="insol_time_july" output=insol_time_july --overwrite -r;
../location/PERMANENT/cell/irrad_aug ../location/PERMANENT/cell/insol_time_aug: irrad_aug insol_time_aug
	LOCAL r.external input="irrad_aug" output=irrad_aug --overwrite -r; r.external input="insol_time_aug" output=insol_time_aug --overwrite -r;
../location/PERMANENT/cell/irrad_sep ../location/PERMANENT/cell/insol_time_sep: irrad_sep insol_time_sep
	LOCAL r.external input="irrad_sep" output=irrad_sep --overwrite -r; r.external input="insol_time_sep" output=insol_time_sep --overwrite -r;
../location/PERMANENT/cell/irrad_oct ../location/PERMANENT/cell/insol_time_oct: irrad_oct insol_time_oct
	LOCAL r.external input="irrad_oct" output=irrad_oct --overwrite -r; r.external input="insol_time_oct" output=insol_time_oct --overwrite -r;
../location/PERMANENT/cell/irrad_nov ../location/PERMANENT/cell/insol_time_nov: irrad_nov insol_time_nov
	LOCAL r.external input="irrad_nov" output=irrad_nov --overwrite -r; r.external input="insol_time_nov" output=insol_time_nov --overwrite -r;
../location/PERMANENT/cell/irrad_dec ../location/PERMANENT/cell/insol_time_dec: irrad_dec insol_time_dec
	LOCAL r.external input="irrad_dec" output=irrad_dec --overwrite -r; r.external input="insol_time_dec" output=insol_time_dec --overwrite -r;

