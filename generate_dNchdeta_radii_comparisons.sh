echo 'Starting generate_dNchdeta_radii_comparisons.sh'

rm *.dat

#HBTGFFileToUse=HBTradii_GF_cfs_no_df.dat
HBTGFFileToUse=HBTradii_GF_cfs_fitLSQ.dat

resultsDirectory=HBT_vs_dNchdeta_results

gauss_quadrature n=15 kind=5 alpha=0 beta=0 a=0 b=13 > KT.dat
gauss_quadrature n=48 kind=1 alpha=0 beta=0 a=0 b=6.2831853071795864769252867665 > KPHI.dat

for sys in pp pPb PbPb
do
	for cen in '0-0.001%' '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%'
	do
		direc=RESULTS_EA_`echo $sys`_C`echo $cen`
		if [ ! -d "$direc" ]
		then
			continue
		fi
		echo '  - processing' $direc
		#unzip -o $direc/job-1.zip job-1/event-1/Charged_eta_integrated_vndata.dat -d $direc
		#unzip -o $direc/job-1.zip job-1/event-1/HBTradii_GF_cfs_no_df.dat -d $direc
		./get_SurfaceX_and_SurfaceY.sh $direc
		python interpolate_SVs.py $direc/job-1/event-1/Sourcefunction_variances_WR_no_df.dat
		for KT in 50 100 150 200 250 300 350 400 450 500 750 1000
		do
			awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> $resultsDirectory/dNchdeta_`echo $sys`_kt`echo $KT`MeV.dat
			awk -v ktval=$KT '1000*$1==ktval && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/${HBTGFFileToUse} >> $resultsDirectory/HBTradii_`echo $sys`_kt`echo $KT`MeV.dat
			awk -v ktval=$KT '1000*$1==ktval' $direc/job-1/event-1/SV_cfs.dat >> $resultsDirectory/SV_cfs_`echo $sys`_kt`echo $KT`MeV.dat
		done
	done
        for KT in 50 100 150 200 250 300 350 400 450 500 750 1000
        do
	        paste $resultsDirectory/dNchdeta_`echo $sys`_kt`echo $KT`MeV.dat \
	              $resultsDirectory/HBTradii_`echo $sys`_kt`echo $KT`MeV.dat | tac > $resultsDirectory/HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`MeV.dat
	        paste $resultsDirectory/dNchdeta_`echo $sys`_kt`echo $KT`MeV.dat \
	              $resultsDirectory/SV_cfs_`echo $sys`_kt`echo $KT`MeV.dat | tac > $resultsDirectory/SV_cfs_vs_dNchdeta_`echo $sys`_kt`echo $KT`MeV.dat
	done
done

# End of file
