#! /usr/bin/env bash

#workingDirectory="../../CHUNCHECKS/AXIS_XYZ_rho/RESFRAC_0.00/results"
#qsub -v workingDirectory=$workingDirectory,currentDirectory=`pwd` run.pbs

#workingDirectory="../../CHUNCHECKS/AXIS_XYZ_omega/RESFRAC_0.00/results"
#qsub -v workingDirectory=$workingDirectory,currentDirectory=`pwd` run.pbs

workingDirectory="../../../PlayGround/job-1/HoTCoffeeh/FULL_results"
qsub -v workingDirectory=$workingDirectory,currentDirectory=`pwd` run.pbs
