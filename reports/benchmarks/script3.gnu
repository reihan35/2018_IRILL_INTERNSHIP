#Temps système
set output "system_time.pdf"
set title "Le temps système" 
set ylabel "Vitesse en seconde"
set xlabel "Nombre d’exécutions"
set style data lines
plot "testy3.dat" using 1:2 with lines title "JsOfOcaml", "testy3.dat" using 1:3 with lines title "Obrowser","testy3.dat" using 1:4 with line title "BuckleScript"

set term postscript 
set output "system_time.pdf"
replot 
