#Temps exécution js_of_ocaml et buckleScript
set output "running_time.pdf"
set title "Le temps d'exécution" 
set ylabel "Vitesse en milliseconde"
set xlabel "Nombre d’exécutions"
set style data lines
plot "tempexec.dat" using 1:2 with lines title "JsOfOcaml", "tempexec.dat" using 1:3 with lines title "BuckleSctipt"

set term postscript 
set output "real_time.pdf"
replot 
