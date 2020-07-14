\rm dNchdeta_*_kt*.dat HBTradii_*_kt*.dat

for sys in pp pPb PbPb
do
	for cen in '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%'
	do
		direc=RESULTS_EA_`echo $sys`_C`echo $cen`
		if [ -d "$direc" ]
		then
			#unzip -o $direc/job-1.zip job-1/event-1/Charged_eta_integrated_vndata.dat -d $direc
			#unzip -o $direc/job-1.zip job-1/event-1/HBTradii_GF_cfs_no_df.dat -d $direc
                        KT=250MeV
                        awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
                        awk '$1==0.25 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
			KT=400MeV
			awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
			awk '$1==0.4 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
			KT=450MeV
	                awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
	                awk '$1==0.45 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
		fi
	done
        KT=250MeV
        paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	KT=400MeV
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
        KT=450MeV
        paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
done
