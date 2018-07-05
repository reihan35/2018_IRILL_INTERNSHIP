case $1 in

js_of_ocaml )
	
	./time_js.sh $1 $2
;;	
bucklescript )
	./time_bs.sh $1 $2
;;
obrowser )
	#echo -e "hello2"
	./time_ob.sh $1 $2
;;
esac
