#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pp)
		for ff in 1000 1100 1200 1300 1400 1500 1600 2000 2500 3000 3500 4000 4500 5000
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_dNchdeta100_ff${ff}.py \
					initial_condition_control:'centrality'='0-100%' \
					superMCParameters:'Aproj'=1 \
					superMCParameters:'Atarg'=1 \
					superMCParameters:'ecm'=7000 \
					superMCParameters:'finalFactor'=${ff} \
					HoTCoffeehControl:'runHoTCoffeeh'=False

			./generateJobs_local.py 1 50000 \
			  PlayGround_EA_${sys}_dNchdeta100_ff${ff} \
			  RESULTS_EA_${sys}_dNchdeta100_ff${ff} \
			  03:00:00 no \
			  ParameterDict_EA_${sys}_dNchdeta100_ff${ff}.py

			./submitJobs_local.py

			sleep 5
		done
		;;
	pPb)
		for ff in 150 200 250 300 350 400 450 500 600 700 800 900
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_dNchdeta100_ff${ff}.py \
					initial_condition_control:'centrality'='0-100%' \
					superMCParameters:'Aproj'=1 \
					superMCParameters:'Atarg'=208 \
					superMCParameters:'ecm'=5020 \
					superMCParameters:'finalFactor'=${ff} \
					superMCParameters:'maxx'='10.0' \
					superMCParameters:'maxy'='10.0' \
					hydroParameters:'iLS'=200 \
					HoTCoffeehControl:'runHoTCoffeeh'=False

			./generateJobs_local.py 1 50000 \
			  PlayGround_EA_${sys}_dNchdeta100_ff${ff} \
			  RESULTS_EA_${sys}_dNchdeta100_ff${ff} \
			  03:00:00 no \
			  ParameterDict_EA_${sys}_dNchdeta100_ff${ff}.py

			./submitJobs_local.py

			sleep 5
		done
		;;

	PbPb)
		for ff in 40 45 50 55 60 65 70
		do
			python updateParameterDict.py ParameterDict_EA_${sys}_dNchdeta100_ff${ff}.py \
					initial_condition_control:'centrality'='0-100%' \
					superMCParameters:'Aproj'=208 \
					superMCParameters:'Atarg'=208 \
					superMCParameters:'ecm'=2760 \
					superMCParameters:'finalFactor'=${ff} \
					superMCParameters:'maxx'='20.0' \
					superMCParameters:'maxy'='20.0' \
					hydroParameters:'iLS'=400 \
					HoTCoffeehControl:'runHoTCoffeeh'=False

			./generateJobs_local.py 1 10000 \
			  PlayGround_EA_${sys}_dNchdeta100_ff${ff} \
			  RESULTS_EA_${sys}_dNchdeta100_ff${ff} \
			  03:00:00 no \
			  ParameterDict_EA_${sys}_dNchdeta100_ff${ff}.py

			./submitJobs_local.py

			sleep 5
		done
		;;

	*)
		echo $"Usage: $0 {pp|pPb|PbPb}"
		exit 1
 
esac
