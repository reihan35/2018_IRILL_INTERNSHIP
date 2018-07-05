opam switch 4.02.3 > /dev/null
   eval `opam config env`
   cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week_4_temps_d_exec/CtoF_Buckle_scripts_alert/src

   for i in $(seq 1 $2)
	do
		echo "exécution n° $i finie."
		(time -p npm run build ) > outfile 2>>/home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week_4_temps_d_exec/time2.txt
	done
	cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week_4_temps_d_exec/
	
   		while IFS='' read -r line || [[ -n "$line" ]]; do
			a=($line)	
			if [ ${a[0]} == "real" ]
			then 
				echo ${a[1]} >> realsm$1.txt
			fi

			if [ ${a[0]} == "user" ]
			then 
				echo ${a[1]} >> usersm$1.txt
			fi

			if [ ${a[0]} == "sys" ]
			then 
				echo ${a[1]} >> sysm$1.txt
			fi

	#echo "Text read from file: $line"
		done < "time2.txt"


sed 's/,/./' realsm$1.txt >> real$1.txt
rm -f realsm$1.txt
sed 's/,/./' usersm$1.txt >> user$1.txt 
rm -f usersm$1.txt
sed 's/,/./' sysm$1.txt >> sys$1.txt
rm -f sysm$1.txt


echo -e "***************************************"

echo -e "Pour "$1

echo -e "temps moyen (réel) sur $2 exécution : "

./bench real$1.txt

echo -e "\ntemps moyen (utilisateur) sur $2 exécution :"

./bench user$1.txt 

echo -e "\ntemps moyen (système) sur $2 exécution :"

./bench sys$1.txt
