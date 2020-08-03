#! /usr/bin/env bash
#-------------------

rm -rf HBT_vs_dNchdeta_results
mkdir HBT_vs_dNchdeta_results

./generate_dNchdeta_radii_comparisons.sh

zip -r all_results_pitzer.zip \
       RESULTS_EA_*_C*%/job-1/event-1/Surface[XY].dat \
       RESULTS_EA_*_C*%/job-1/event-1/HBT*.dat \
       RESULTS_EA_*_C*%/job-1/event-1/R2ij*.dat \
       HBT_vs_dNchdeta_results

echo 'Finished all!'
