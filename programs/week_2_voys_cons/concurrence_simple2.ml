(* Exemple tout simple pour lancer deux thread et attendre que les resulats soient finis pour les afficher *)

let v = ref 0 in
let t = Thread.create(fun () -> v:=!v+1) (print_string "t1 ajoute") in
let t2 = Thread.create(fun () -> v:=!v+2) (print_string "t2 ajoute") in

Thread.join t;
Thread.join t2;

print_string ("C'est terminé ca donne "^(string_of_int !v));;