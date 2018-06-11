open Lwt

(* Le probelem de diner des philosophes *)

type objet =
{
	mutable c:int;
};;

let a = {c=0};;
let (>>=) = Lwt.bind ;;

let consommateur () =
  Lwt_io.printlf  "Le consommateur consomme l'objet!" >>= (fun() ->(Lwt.return a.c<-0));;


let producteur () =
  a.c = "hello";
  Lwt_io.printf  "Le producteur produit l'objet!">>= (fun() -> (Lwt.return a.c<-2));;


(*     Lwt.bind (Lwt_unix.sleep 1.0) (tic ());; *)

(* let p() = *)
(*   Lwt.bind *)
(*   (Lwt_io.read_line Lwt_io.stdin) *)
(*   (fun str -> Lwt_io.printlf "You typed %S" (String.uppercase str));; *)

(* let main() = *)
let main() =
  for i=0 to 5 do
  Lwt_main.run (producteur ());
  Lwt_main.run (consommateur());
  done;;

(* A aucun moments on devrait avoir un resulat du style : Le consommateur récupère le mot et efface l'objet *)

(*let (>>=) = Lwt.bind ;;
  let rec f () = Lwt_io.printl "Ping" >>=
  (fun () -> (Lwt_unix.sleep 4.)) >>= f ;;
  let rec g () = Lwt_io.printl "Pong" >>=
  (fun () -> (Lwt_unix.sleep 3.)) >>= g ;;
  Lwt_main.run (f ()) ;;*)
(*   Lwt_main.run (g()) ;; *)