#! /usr/bin/env bash

ev=1
nev=1000000
order=$1

while [ "$ev" -le "$nev" ]
do
	\rm data/BinaryCollision*
	\rm data/Spectators*
	\rm data/Participant*
	\rm data/sd_event_*
	\rm data/sn_ecc_eccp_10_event_*.dat
	FILE=data/sn_ecc_eccp_${order}_event_${ev}.dat
	if [ -f "$FILE" ]
	then
		cat $FILE >> sn_ecc_eccp_${order}_nev_${nev}.dat
		\rm $FILE
		ev=$[ev+1]
	fi
done
