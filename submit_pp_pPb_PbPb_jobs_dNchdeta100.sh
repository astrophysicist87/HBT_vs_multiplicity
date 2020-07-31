#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pp)
		python updateParameterDict.py ParameterDict_EA_${sys}_MB_dNchdeta100.py \
			initial_condition_control:'centrality'='0-100%' \
			superMCParameters:'Aproj'=1 \
			superMCParameters:'Atarg'=1 \
			superMCParameters:'ecm'=7000 \
			superMCParameters:'finalFactor'=1303.53 \
			superMCParameters:'maxx'='10.0' \
			superMCParameters:'maxy'='10.0' \
			superMCParameters:'dx'='0.1' \
			superMCParameters:'dy'='0.1' \
			hydroParameters:'iLS'=100 \
			hydroParameters:'dx'='0.1' \
			hydroParameters:'dy'='0.1'

		./generateJobs_local.py 1 10000 \
			PlayGround_EA_${sys}_MB_dNchdeta100 \
			RESULTS_EA_${sys}_MB_dNchdeta100 \
			03:00:00 no \
			ParameterDict_EA_${sys}_MB_dNchdeta100.py

		./submitJobs_local.py

		sleep 5
		;;
	pPb)
		python updateParameterDict.py ParameterDict_EA_${sys}_MB_dNchdeta100.py \
			initial_condition_control:'centrality'='0-100%' \
			superMCParameters:'Aproj'=1 \
			superMCParameters:'Atarg'=208 \
			superMCParameters:'ecm'=5020 \
			superMCParameters:'finalFactor'=308.215 \
			superMCParameters:'maxx'='10.0' \
			superMCParameters:'maxy'='10.0' \
			superMCParameters:'dx'='0.1' \
			superMCParameters:'dy'='0.1' \
			hydroParameters:'iLS'=100 \
			hydroParameters:'dx'='0.1' \
			hydroParameters:'dy'='0.1'

		./generateJobs_local.py 1 10000 \
			PlayGround_EA_${sys}_MB_dNchdeta100 \
			RESULTS_EA_${sys}_MB_dNchdeta100 \
			03:00:00 no \
			ParameterDict_EA_${sys}_MB_dNchdeta100.py

		./submitJobs_local.py

		sleep 5
		;;
	PbPb)
		python updateParameterDict.py ParameterDict_EA_${sys}_MB_dNchdeta100.py \
			initial_condition_control:'centrality'='0-100%' \
			superMCParameters:'Aproj'=208 \
			superMCParameters:'Atarg'=208 \
			superMCParameters:'ecm'=2760 \
			superMCParameters:'finalFactor'=12.6947 \
			superMCParameters:'maxx'='20.0' \
			superMCParameters:'maxy'='20.0' \
			superMCParameters:'dx'='0.1' \
			superMCParameters:'dy'='0.1' \
			hydroParameters:'iLS'=200 \
			hydroParameters:'dx'='0.1' \
			hydroParameters:'dy'='0.1'

		./generateJobs_local.py 1 10000 \
			PlayGround_EA_${sys}_MB_dNchdeta100 \
			RESULTS_EA_${sys}_MB_dNchdeta100 \
			24:00:00 no \
			ParameterDict_EA_${sys}_MB_dNchdeta100.py

		./submitJobs_local.py

		sleep 5
		;;
	*)
		echo $"Usage: $0 {pp|pPb|PbPb}"
		exit 1
 
esac
