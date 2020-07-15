#! /usr/bin/env bash
#-------------------

sys=$1

case "$sys" in
	pp)
            for cen in '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%' '0-100%'
            do
                python updateParameterDict.py ParameterDict_EA_${sys}_C${cen}.py \
                        initial_condition_control:'centrality'=${cen} \
                        superMCParameters:'Aproj'=1 \
                        superMCParameters:'Atarg'=1 \
                        superMCParameters:'ecm'=7000 \
                        superMCParameters:'finalFactor'=81.1114
                        
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
                        superMCParameters:'finalFactor'=52.663
                       
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
                        superMCParameters:'finalFactor'=55.3037
                       
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




#! /usr/bin/env bash

# Tune "finalfactor" first
#for ff in 35 40 45 50 53 54 55 56 57 60 65 70 75 80
#do
#	python updateParameterDict.py ParameterDict_EA_PbPb_FF${ff}.py superMCParameters:finalFactor=${ff}
#	./generateJobs_local.py 1 5000 PlayGround_EA_PbPb_FF${ff} RESULTS_EA_PbPb_FF${ff} 03:00:00 no ParameterDict_EA_PbPb_FF${ff}.py
#	./submitJobs_local.py
#	sleep 5
#done
#finalFactor obtained: 55.3037



