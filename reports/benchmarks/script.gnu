#Temps reel
set output "real_time.pdf"
set title "Le temps réel" 
set ylabel "Vitesse en seconde"
set xlabel "Nombre d’exécutions"
set style data lines
plot "testy1.dat" using 1:2 with lines title "JsOfOcaml", "testy1.dat" using 1:3 with lines title "Obrowser","testy1.dat" using 1:4 with line title "BuckleScript"

set term postscript 
set output "real_time.pdf"
replot 
