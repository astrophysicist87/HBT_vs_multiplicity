#! /usr/bin/env bash
#-------------------

for sys in pp_MB pPb PbPb
do
	#for cen in '0-0.001%' '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%'
	#do
		#direc=RESULTS_EA_`echo $sys`_C`echo $cen`
		direc=RESULTS_EA_`echo $sys`_dNchdeta100
		if [ -d "$direc" ]
		then
			./run_svwr.sh $direc &
		fi
	#done
	#wait
done
