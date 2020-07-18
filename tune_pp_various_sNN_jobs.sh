#! /usr/bin/env bash
#-------------------

# Use sqrt(s_NN), not s_NN
sNN=$1
sys="pp"

for ff in 50 55 60 65 70 75 80 85 90 95 100
do
	python updateParameterDict.py ParameterDict_EA_${sys}_sqrtSNN${sNN}_ff${ff}.py \
			initial_condition_control:'centrality'='0-100%' \
			superMCParameters:'Aproj'=1 \
			superMCParameters:'Atarg'=1 \
			superMCParameters:'ecm'=${sNN} \
			superMCParameters:'finalFactor'=${ff} \
			HoTCoffeehControl:'runHoTCoffeeh'=False

	./generateJobs_local.py 1 50000 \
	  PlayGround_EA_${sys}_sqrtSNN${sNN}_ff${ff} \
	  RESULTS_EA_${sys}_sqrtSNN${sNN}_ff${ff} \
	  12:00:00 no \
	  ParameterDict_EA_${sys}_sqrtSNN${sNN}_ff${ff}.py

	./submitJobs_local.py

	sleep 5
done
