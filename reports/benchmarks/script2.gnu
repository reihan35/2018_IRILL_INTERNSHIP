#Temps utilisateur
set output "user_time.pdf"
set title "Le temps utilisateur" 
set ylabel "Vitesse en seconde"
set xlabel "Nombre d’exécutions"
set style data lines
plot "testy2.dat" using 1:2 with lines title "JsOfOcaml", "testy2.dat" using 1:3 with lines title "Obrowser","testy2.dat" using 1:4 with line title "BuckleScript"

set term postscript 
set output "user_time.pdf"
replot 
