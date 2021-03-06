#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pp)
		for cen in '0-0.001%' '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			count=10000
			if [ "$cen" == '0-0.001%' ]
			then
				count=1000
			fi
			if [ "$cen" == '0-0.01%' ]
			then
				count=1000
			fi
			cenAlt=`echo "$cen" | tr . '_'`
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cenAlt}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=1 \
				superMCParameters:'Atarg'=1 \
				superMCParameters:'ecm'=7000 \
				superMCParameters:'finalFactor'=80.377 \
				superMCParameters:'maxx'='10.0' \
				superMCParameters:'maxy'='10.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=100 \
				hydroParameters:'dx'='0.1' \
				hydroParameters:'dy'='0.1'

			./generateJobs_cluster.py 1 $count pitzer \
				PlayGround_EA_${sys}_C${cen} \
				RESULTS_EA_${sys}_C${cen} \
				18:00:00 "no" \
				ParameterDict_EA_${sys}_C${cenAlt}.py \

			./submitJobs_qsub.py

			sleep 5
		done
		;;
	pPb)
		for cen in '0-0.001%' '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
		do
			count=10000
			if [ "$cen" == '0-0.001%' ]
			then
				count=100
			fi
			if [ "$cen" == '0-0.01%' ]
			then
				count=1000
			fi
			cenAlt=`echo "$cen" | tr . '_'`
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cenAlt}.py \
				initial_condition_control:'centrality'=${cen} \
				superMCParameters:'Aproj'=1 \
				superMCParameters:'Atarg'=208 \
				superMCParameters:'ecm'=5020 \
				superMCParameters:'finalFactor'='54.3968' \
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
				ParameterDict_EA_${sys}_C${cenAlt}.py

			./submitJobs_qsub.py

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
				superMCParameters:'finalFactor'=55.1918 \
				superMCParameters:'maxx'='20.0' \
				superMCParameters:'maxy'='20.0' \
				superMCParameters:'dx'='0.1' \
				superMCParameters:'dy'='0.1' \
				hydroParameters:'iLS'=200 \
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
		echo $"Usage: $0 {pp|pPb|PbPb}"
		exit 1
 
esac
