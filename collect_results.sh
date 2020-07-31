#! /usr/bin/env bash
#-------------------

rm -rf HBT_vs_dNchdeta_results
mkdir HBT_vs_dNchdeta_results

./generate_dNchdeta_radii_comparisons.sh

for direc in RESULTS_EA_*_dNchdeta100
do
	./get_SurfaceX_and_SurfaceY.sh $direc
done

zip -r all_results_moreKT.zip \
       RESULTS_EA_*_dNchdeta100/job-1/event-1/Surface[XY].dat \
       RESULTS_EA_*_dNchdeta100/job-1/event-1/HBT*.dat \
       RESULTS_EA_*_dNchdeta100/job-1/event-1/emission*dat \
       RESULTS_EA_*_dNchdeta100/job-1/event-1/Source*dat \
       RESULTS_EA_*_C*%/job-1/event-1/Surface[XY].dat \
       RESULTS_EA_*_C*%//job-1/event-1/HBT*.dat \
       RESULTS_EA_*_C*%/job-1/event-1/emission*dat \
       RESULTS_EA_*_C*%/job-1/event-1/Source*dat \
       HBT_vs_dNchdeta_results

echo 'Finished all!'
