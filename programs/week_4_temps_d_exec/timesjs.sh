echo $1

if [ $1=="js_of_ocaml" ]; then 

opam switch 4.06.0 > /dev/null
eval `opam config env`

for i in $(seq 1 $2)
do
echo "exécution n° $i finie."

(time -p ocamlfind ocamlc js_affiche.ml -o js_affiche.byte -package js_of_ocaml -package js_of_ocaml-ppx -linkpkg | tail -n 3 | head -n 1) > outfile 2>>time1.txt

js_of_ocaml js_affiche.byte

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
done < "time1.txt"

done

elif [ $1=="bucklescript" ];then

echo "je suis là"

opam switch 4.02.3 > /dev/null
eval `opam config env`

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week_4_temps_d_exec/CtoF_Buckle_scripts_alert/src

(time -p npm run build ) > outfile 2>>time2.txt


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

else 

opam switch 3.12.1 > /dev/null
eval `opam config env`

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTEsRNSHIP/lib/obrowser-master/examples/CtoF_Obrowser_alert

(time -p make) > outfile 2>>time3.txt

fi

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
done < "time3.txt"


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

