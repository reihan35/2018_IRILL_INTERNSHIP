#! /bin/bash

echo "Applications avec une alert simple : "


opam switch 4.06.0 > /dev/null
eval `opam config env`

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week_4_temps_d_exec/

echo "Js_of_ocaml :"

time ocamlfind ocamlc js_affiche.ml -o js_affiche.byte -package js_of_ocaml -package js_of_ocaml-ppx -linkpkg

js_of_ocaml js_affiche.byte

##################################

opam switch 3.12.1 > /dev/null
eval `opam config env`

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/lib/obrowser-master/examples/CtoF_Obrowser_alert

echo "Obrowser :"

time make > /dev/null

##################################

opam switch 4.02.3 > /dev/null
eval `opam config env`

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week_4_temps_d_exec/CtoF_Buckle_scripts_alert/src

echo "BuckleScript :"

time npm run build > /dev/null

##################################

echo "Applications conversion degré Celsius/Fahrenheit"

opam switch 4.06.0 > /dev/null
eval `opam config env` 


cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week1_C_to_F/CtoF_Js_of_ocaml/

echo "Js_of_ocaml :"

time ocamlfind ocamlc exemple.ml -o exemple.byte -package js_of_ocaml -package js_of_ocaml-ppx -linkpkg

js_of_ocaml exemple.byte
##################################
 
opam switch 3.12.1 > /dev/null
eval `opam config env` 

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/lib/obrowser-master/examples/CtoF_Obrowser

echo "Obrowser :"

time make > /dev/null

##################################

opam switch 4.02.3 > /dev/null
eval `opam config env` 

cd /home/fati/UPMC/Stage_été_2018/2018_IRILL_INTERNSHIP/programs/week1_C_to_F/CtoF_Buckle_scripts/src

echo "BuckleScript :"

time npm run build > /dev/null
