#! /usr/bin/env bash
#-------------------

# some results directory to post-process
# assumes structure: $WD/job-1/event-1/*
workingDirectory=$1

for direc in $workingDirectory/HoTCoffeeh
do
	rm -rf $direc
done

for direc in $workingDirectory/job-1/event-1/post_processing_results
do
        rm -rf $direc
done

cp -r EBE-Node/HoTCoffeeh $workingDirectory
resultsDirectory=$workingDirectory/HoTCoffeeh/results
rm -rf $resultsDirectory
mkdir $resultsDirectory

cp $workingDirectory/job-1/event-1/decdat2.dat   $resultsDirectory
cp $workingDirectory/job-1/event-1/decdat_mu.dat $resultsDirectory
cp $workingDirectory/job-1/event-1/surface.dat   $resultsDirectory

(
	cd $workingDirectory/HoTCoffeeh
	echo 'Now in: ' `pwd`
		
	nice -n 0 time bash ./HoTCoffeeh.sh true false \
		SV_npphi=48 chosenParticlesMode=0 qtnpts=51 delta_qz=0.0125 \
		calculate_CF_mode=0 flag_negative_S=1 CF_resonanceThreshold=0.0 \
		particle_diff_tolerance=0.0 nKT=101 KTmin=0.01 CF_npY=21 KTmax=1.01 \
		use_plane_psi_order=0 CF_npT=15 fit_with_projected_cfvals=1 \
		use_log_fit=1 CF_npphi=36 flesh_out_cf=1 use_lambda=1 tolerance=0.0 \
		qynpts=7 ignore_long_lived_resonances=1 delta_qx=0.025 delta_qy=0.025 \
		include_bulk_pi=1 grouping_particles=0 SV_resonanceThreshold=0.0 \
		max_lifetime=100.0 include_delta_f=0 SV_npT=15 use_extrapolation=1 \
		n_order=4 qxnpts=7 qznpts=7 nKphi=48 \
		&> ./results/all.out

	mv results ../job-1/event-1/post_processing_results

	cd - &>/dev/null
)

