open Lwt

let calcul = fun n ->
  Lwt.return ((n + 1) * 2)

let auteuil = fun () -> Lwt_io.print "Salut " >>=
  (fun () -> Lwt.choose [Lwt_io.print "vas ";
             Lwt_io.print "tu "] >>= (fun () -> Lwt_io.printl "bien"))


(*fonction qui renvoie le nombre de quelques caracteres speciaux*)
let rec nbr_voys str i n =
	match (str,i, n) with
	| ("",i, n) -> -1
	| (str,i, n) when i = n -> 0
	| (str, i, n) when str.[i] = 'a' || str.[i] = 'e' || str.[i] = 'i' || str.[i] = 'o' || str.[i] = 'y' || str.[i] = 'u' || str.[i] = 'A' || str.[i] = 'E' || str.[i] = 'I' || str.[i] = 'O' || str.[i] = 'Y' || str.[i] = 'U' -> 1 + nbr_voys str (i+1) n
	| (str, i, n) -> nbr_voys str (i+1) n;;

let nbr_cons str =
 ( String.length str ) - nbr_voys str 0 (String.length str);;

(*Une array que l'on va utiliser comme effet de bord pour y sauvgarder le nbr de voyelles et de consonnes de la chaine de caracteres lue sur l'entree principale*)
let a = Array.make 2 0;;

(*La Thread qui changera la valeur de la premier case de l'array avec le nombre de consonnes de la string passée en parametre puis afin de renvoyer un Lwt unti fait un affichage*)
let nbr_cons2 = fun n ->
 a.(0)<-nbr_cons n;
 Lwt.return(print_string ("le nbr de cts = "^(string_of_int a.(0))))


(*La Thread qui changera la valeur de la premier case de l'array avec le nombre de voyelles de la string passée en parametre puis afin de renvoyer un Lwt unti fait un affichage*)
let nbr_voys2 = fun n ->
 a.(1)<-nbr_voys n 0 (String.length n);
 Lwt.return(print_string ("le nbr de vs = "^(string_of_int a.(1))))


(*La thread principale qui va lancer deux thread lecture puis attendre qu'elles finissient*)
let () =
  Lwt_main.run ((Lwt_io.read_line Lwt_io.stdin) >>= (fun s -> (Lwt.join [nbr_voys2 s ;nbr_cons2 s])))


(* let () = Lwt_main.run ((auteuil ()) >>= *)
(*                        (fun () -> (Lwt.choose [Lwt_unix.sleep 1. >>= (fun () -> Lwt.return 4); *)
(*                                                Lwt_unix.sleep 1. >>= (fun () -> Lwt.return 1);]) >>= calcul >>= *)
(*                        (fun n -> (Lwt_io.printlf "Résultat du calcul : %d" n)))) *)
