rm *.dat

for sys in pp pp_SoE2 3pp SHRINK4pp pPb AuAu
do
	for cen in '0-0.001%' '0-0.01%' '0-0.1%' '0-1%' '0-10%' '10-20%' '20-30%' '30-40%' '40-50%' '50-60%' '60-70%' '70-80%' '80-90%' '90-100%'
	do
		direc=RESULTS_EA_`echo $sys`_C`echo $cen`
		if [ ! -d "$direc" ]
		then
			continue
		fi
		#unzip -o $direc/job-1.zip job-1/event-1/Charged_eta_integrated_vndata.dat -d $direc
		#unzip -o $direc/job-1.zip job-1/event-1/HBTradii_GF_cfs_no_df.dat -d $direc
		KT=250MeV
		awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.25 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.25' $direc/job-1/event-1/SV_cfs.dat >> SV_cfs_`echo $sys`_kt`echo $KT`.dat
		KT=350MeV
		awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.35 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.35' $direc/job-1/event-1/SV_cfs.dat >> SV_cfs_`echo $sys`_kt`echo $KT`.dat
		KT=400MeV
		awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.4 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.4' $direc/job-1/event-1/SV_cfs.dat >> SV_cfs_`echo $sys`_kt`echo $KT`.dat
		KT=450MeV
		awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.45 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.45' $direc/job-1/event-1/SV_cfs.dat >> SV_cfs_`echo $sys`_kt`echo $KT`.dat
		KT=550MeV
		awk 'NR==1 {print $2}' $direc/job-1/event-1/Charged_eta_integrated_vndata.dat >> dNchdeta_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.55 && $2==0 {print $3, $5, $9}' $direc/job-1/event-1/HBTradii_GF_cfs_no_df.dat >> HBTradii_`echo $sys`_kt`echo $KT`.dat
		awk '$1==0.55' $direc/job-1/event-1/SV_cfs.dat >> SV_cfs_`echo $sys`_kt`echo $KT`.dat
	done
	KT=250MeV
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat SV_cfs_`echo $sys`_kt`echo $KT`.dat | tac > SV_cfs_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	KT=350MeV
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat SV_cfs_`echo $sys`_kt`echo $KT`.dat | tac > SV_cfs_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	KT=400MeV
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat SV_cfs_`echo $sys`_kt`echo $KT`.dat | tac > SV_cfs_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	KT=450MeV
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat SV_cfs_`echo $sys`_kt`echo $KT`.dat | tac > SV_cfs_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	KT=550MeV
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat HBTradii_`echo $sys`_kt`echo $KT`.dat | tac > HBTradii_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
	paste dNchdeta_`echo $sys`_kt`echo $KT`.dat SV_cfs_`echo $sys`_kt`echo $KT`.dat | tac > SV_cfs_vs_dNchdeta_`echo $sys`_kt`echo $KT`.dat
done

# End of file
