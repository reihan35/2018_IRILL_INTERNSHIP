open Lwt

let win = Dom_html.window (*initalisation de l'objet window*)

(*On utilise l'objet bouton en récupérant avec le DOM HTML l'objet qui a pour id 'clickme' puis on le 'coerce' en valuer Js_of_caml*)

let btn = Dom_html.getElementById "clickme"
let opt = Dom_html.CoerceTo.button btn
let b = Js.Opt.get opt (fun() -> failwith "erreur")

(*On récupère le dom HTML de la balise p (qui a pour id = "count")*)
let d = Dom_html.getElementById "count"


(*On initalise l'objet input (là où l'utilisateur saisie la valeure) en récupérant avec le DOM HTML l'objet qui a pour id 'textF' puis on le 'coerce' en valuer Js_of_caml*)

let input = Dom_html.getElementById "textF"
let opt2 = Dom_html.CoerceTo.input input
let i = Js.Opt.get opt2 (fun() -> failwith "erreur")


(*Dans le champs handler du bouton on met la fonction que l'on vient de créer qui nous permet donc de définir la fonction clicked comme une action qui se declenche*)

let rec nbr_voys str i n =
	match (str,i, n) with
	| ("",i, n) -> -1
	| (str,i, n) when i = n -> 0
	| (str, i, n) when str.[i] = 'a' || str.[i] = 'e' || str.[i] = 'i' || str.[i] = 'o' || str.[i] = 'y' || str.[i] = 'u' || str.[i] = 'A' || str.[i] = 'E' || str.[i] = 'I' || str.[i] = 'O' || str.[i] = 'Y' || str.[i] = 'U' -> 1 + nbr_voys str (i+1) n
	| (str, i, n) -> nbr_voys str (i+1) n;;

let nbr_cons str =
 ( String.length str ) - nbr_voys str 0 (String.length str);;

let a = Array.make 2 0;;

let nbr_cons2 = fun n deg->
(*  a.(0)<-nbr_cons n; *)
 (Lwt.return(deg##.innerHTML := (Js.string (string_of_int(nbr_cons n)))))

let nbr_voys2 = fun n deg->
(*  a.(1)<-nbr_voys n 0 (String.length n); *)
 (Lwt.return(deg##.innerHTML := (Js.string (string_of_int(nbr_voys n 0 (String.length n))))))

(*La fontion qui prend en paramètre un objet bouton, un objet input et un objet <p> : là ou le résultat s'affiche*)
let clicked i deg=
  Lwt_main.run (Lwt.bind (Lwt.return(Js.to_string(i##.value))) (fun s -> (Lwt.join [(nbr_voys2 s deg) ;(nbr_cons2 s deg)])))

let converterC_handler =
  Dom_html.handler begin
  fun evt -> (
       clicked i d;
    Js._true)
  end


let ()= btn##.onclick := converterC_handler (*On declenche l'action que l'on a definie en cliquant sur le bouton en mettant ce handler dans le champs 'onclick' du bouton*)
