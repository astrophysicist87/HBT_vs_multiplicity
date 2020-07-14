#! /usr/bin/env bash
#-------------------

workingDirectory=$1

cp -r EBE-Node/HoTCoffeeh $workingDirectory
resultsDirectory=$workingDirectory/HoTCoffeeh/results
mkdir $resultsDirectory

cp $workingDirectory/job-1/event-1/decdat2.dat   $resultsDirectory
cp $workingDirectory/job-1/event-1/decdat_mu.dat $resultsDirectory
cp $workingDirectory/job-1/event-1/surface.dat   $resultsDirectory

(
	cd $workingDirectory/HoTCoffeeh
		
	nice -n 0 time bash ./HoTCoffeeh.sh true false \
		SV_resonanceThreshold=0.00 \
		&> ./results/all.out

	mv results ../job-1/event-1/post_processing_results

	cd -
)

