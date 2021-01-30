#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pO200)
		for cen in '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			count=10000
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=1 \
				superMCParameters:'Atarg'=16 \
				superMCParameters:'ecm'=200 \
				superMCParameters:'finalFactor'='28.656' \
				superMCParameters:'maxx'='15.0' \
				superMCParameters:'maxy'='15.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=150 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_cluster.py 1 $count pitzer \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				18:00:00 "no" \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_qsub.py

			sleep 5
		done
		;;
	pO6500)
		for cen in '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			count=10000
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=1 \
				superMCParameters:'Atarg'=16 \
				superMCParameters:'ecm'=6500 \
				superMCParameters:'finalFactor'='80.377' \
				superMCParameters:'maxx'='15.0' \
				superMCParameters:'maxy'='15.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=150 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_cluster.py 1 $count pitzer \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				18:00:00 "no" \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_qsub.py

			sleep 5
		done
		;;
	OO200)
		for cen in '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=16 \
				superMCParameters:'Atarg'=16 \
				superMCParameters:'ecm'=200 \
				superMCParameters:'finalFactor'='28.656' \
				superMCParameters:'maxx'='15.0' \
				superMCParameters:'maxy'='15.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=150 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_cluster.py 1 10000 pitzer \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				24:00:00 "no" \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_qsub.py

			sleep 5
		done
		;;
	OO6500)
		for cen in '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=16 \
				superMCParameters:'Atarg'=16 \
				superMCParameters:'ecm'=6500 \
				superMCParameters:'finalFactor'='80.377' \
				superMCParameters:'maxx'='15.0' \
				superMCParameters:'maxy'='15.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=150 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_cluster.py 1 10000 pitzer \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				24:00:00 "no" \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_qsub.py

			sleep 5
		done
		;;
	*)
		echo $"Usage: $0 {pO200|pO6500|OO200|OO6500}"
		exit 1
 
esac
