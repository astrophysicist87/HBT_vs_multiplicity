#! /usr/bin/env bash
#-------------------

#for sys in pp pPb PbPb
for sys in pp
do
        #for cen in '0-0.001%' '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
	for cen in '80-90%'
	do
		directory=RESULTS_EA_`echo $sys`_C`echo $cen`
		if [ -d "$directory" ]
		then
			#./run_cfwr.sh $directory &
			qsub -v "workingDirectory=$directory" run_cfwr.pbs
		fi
	done
	wait
done
