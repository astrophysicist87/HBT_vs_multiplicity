#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pp)
		cen='0-100%'
		#Target dNchdeta: 6.0
		for ff in 78 79 80 81 82
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}_ff${ff}.py \
					initial_condition_control:'centrality'=${cen} \
					superMCParameters:'Aproj'=1 \
					superMCParameters:'Atarg'=1 \
					superMCParameters:'ecm'=7000 \
					superMCParameters:'finalFactor'=${ff} \
					HoTCoffeehControl:'runHoTCoffeeh'=False

			./generateJobs_local.py 1 50000 \
			  PlayGround_EA_${sys}_C${cen}_ff${ff} \
			  RESULTS_EA_${sys}_C${cen}_ff${ff} \
			  03:00:00 no \
			  ParameterDict_EA_${sys}_C${cen}_ff${ff}.py

			./submitJobs_local.py

			sleep 5
		done
		;;
	pPb)
		cen='0-100%'
		#Target dNchdeta: 17.5
		for ff in 35 40 45 50 53 54 55 56 57 60 65 70 75 80
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}_ff${ff}.py \
					initial_condition_control:'centrality'=${cen} \
					superMCParameters:'Aproj'=1 \
					superMCParameters:'Atarg'=208 \
					superMCParameters:'ecm'=5020 \
					superMCParameters:'finalFactor'=${ff} \
					superMCParameters:'maxx'='10.0' \
					superMCParameters:'maxy'='10.0' \
					hydroParameters:'iLS'=200 \
					HoTCoffeehControl:'runHoTCoffeeh'=False

			./generateJobs_local.py 1 50000 \
			  PlayGround_EA_${sys}_C${cen}_ff${ff} \
			  RESULTS_EA_${sys}_C${cen}_ff${ff} \
			  03:00:00 no \
			  ParameterDict_EA_${sys}_C${cen}_ff${ff}.py

			./submitJobs_local.py

			sleep 5
		done
		;;

	PbPb)
		cen='0-5%'
		#Target dNchdeta: 1601
		for ff in 35 40 45 50 53 54 55 56 57 60 65 70 75 80
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}_ff${ff}.py \
					initial_condition_control:'centrality'=${cen} \
					superMCParameters:'Aproj'=208 \
					superMCParameters:'Atarg'=208 \
					superMCParameters:'ecm'=2760 \
					superMCParameters:'finalFactor'=${ff} \
					superMCParameters:'maxx'='20.0' \
					superMCParameters:'maxy'='20.0' \
					hydroParameters:'iLS'=400 \
					HoTCoffeehControl:'runHoTCoffeeh'=False

			./generateJobs_local.py 1 10000 \
			  PlayGround_EA_${sys}_C${cen}_ff${ff} \
			  RESULTS_EA_${sys}_C${cen}_ff${ff} \
			  03:00:00 no \
			  ParameterDict_EA_${sys}_C${cen}_ff${ff}.py

			./submitJobs_local.py

			sleep 5
		done
		;;

	*)
		echo $"Usage: $0 {pp|pPb|PbPb}"
		exit 1
 
esac
