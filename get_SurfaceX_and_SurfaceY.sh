#for sys in pp AuAu
#do
#	for cen in 0_0.1 0_1 0_10 10_20 20_30 30_40 40_50 50_60 60_70 70_80 80_90 90_100
#	do
#		direc=RESULTS_EA_`echo $sys`_C`echo $cen`_wHBT
		direc=$1
		#unzip -o $direc/job-1.zip job-1/event-1/surface.dat -d $direc
                #unzip -o $direc/job-1.zip job-1/event-1/decdat2.dat -d $direc
		tmpfile=tmp.out
		paste $direc/job-1/event-1/surface.dat $direc/job-1/event-1/decdat2.dat > "$tmpfile"
		awk '$4**2<=0.01 {print $2, $5, sqrt($12**2+$13**2), $3, $12+0.0, $4, $13+0.0}' "$tmpfile" | column -t > $direc/job-1/event-1/SurfaceX.dat
                awk '$3**2<=0.01 {print $2, $5, sqrt($12**2+$13**2), $3, $12+0.0, $4, $13+0.0}' "$tmpfile" | column -t > $direc/job-1/event-1/SurfaceY.dat
		rm "$tmpfile"
#	done
#done
