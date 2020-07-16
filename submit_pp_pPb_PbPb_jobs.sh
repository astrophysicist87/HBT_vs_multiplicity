#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pp)
		for cen in '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=1 \
				superMCParameters:'Atarg'=1 \
				superMCParameters:'ecm'=7000 \
				superMCParameters:'finalFactor'=80.377 \
				superMCParameters:'maxx'='5.0' \
				superMCParameters:'maxy'='5.0' \
				superMCParameters:'dx'='0.05' \
				superMCParameters:'dy'='0.05' \
				hydroParameters:'iLS'=100 \
				hydroParameters:'dx'='0.05' \
				hydroParameters:'dy'='0.05'

			./generateJobs_local.py 1 10000 \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				03:00:00 no \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_local.py

			sleep 5
		done
		;;
	pPb)
		for cen in '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=1 \
				superMCParameters:'Atarg'=208 \
				superMCParameters:'ecm'=5020 \
				superMCParameters:'finalFactor'=54.3181 \
				superMCParameters:'maxx'='10.0' \
				superMCParameters:'maxy'='10.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=100 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_local.py 1 10000 \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				03:00:00 no \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_local.py

			sleep 5
		done
		;;
	PbPb)
		for cen in '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=208 \
				superMCParameters:'Atarg'=208 \
				superMCParameters:'ecm'=2760 \
				superMCParameters:'finalFactor'=55.3037 \
				superMCParameters:'maxx'='20.0' \
				superMCParameters:'maxy'='20.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=200 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_local.py 1 10000 \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				24:00:00 no \
				ParameterDict_EA_${sys}_C${cen}.py

			./submitJobs_local.py

			sleep 5
		done
		;;
	*)
		echo $"Usage: $0 {pp|pPb|PbPb}"
		exit 1
 
esac
