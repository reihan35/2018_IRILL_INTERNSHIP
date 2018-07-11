open Lwt

let win = Dom_html.window (*initalisation de l'objet window*)

(*On utilise l'objet bouton en récupérant avec le DOM HTML l'objet qui a pour id 'clickme' puis on le 'coerce' en valuer Js_of_caml*)

let btn = Dom_html.getElementById "clickme"
let opt = Dom_html.CoerceTo.button btn
let b = Js.Opt.get opt (fun() -> failwith "erreur")

(*On récupère le dom HTML de la balise p (qui a pour id = "count")*)
let d = Dom_html.getElementById "count"
let d2 = Dom_html.getElementById "count2"

(*let box_style =
  Js.string"background-color: red ;" in

d##.style##.cssText := box_style;
*)

(*On initalise l'objet input (là où l'utilisateur saisie la valeure) en récupérant avec le DOM HTML l'objet qui a pour id 'textF' puis on le 'coerce' en valuer Js_of_caml*)

let input = Dom_html.getElementById "textF"
let opt2 = Dom_html.CoerceTo.input input
let i = Js.Opt.get opt2 (fun() -> failwith "erreur")

(*fonction qui desactive un bouton*)
let button_disable btn =
  btn##.disabled := Js._true

let button_enable btn =
  btn##.disabled := Js._false

(*fonction qui renvoie le nombre de voyelles dans une chaine de caracteres*)
let rec nbr_voys str i n =
	match (str,i, n) with
	| ("",i, n) -> -1
	| (str,i, n) when i = n -> 0
	| (str, i, n) when str.[i] = 'a' || str.[i] = 'e' || str.[i] = 'i' || str.[i] = 'o' || str.[i] = 'y' || str.[i] = 'u' || str.[i] = 'A' || str.[i] = 'E' || str.[i] = 'I' || str.[i] = 'O' || str.[i] = 'Y' || str.[i] = 'U' -> 1 + nbr_voys str (i+1) n
	| (str, i, n) -> nbr_voys str (i+1) n;;

(*fonction qui renvoie le nombre de quelques caracteres speciaux*)
let rec nbr_space str i n =
  match (str,i, n) with
  | ("",i, n) -> -1
	| (str,i, n) when i = n -> 0
	| (str, i, n) when str.[i] = ' ' || str.[i] = '*' || str.[i] = '-' || str.[i] = '+'|| str.[i] = '/'|| str.[i] = '_'-> 1 + nbr_space str (i+1) n
	| (str, i, n) -> nbr_space str (i+1) n;;

(*fonction qui renvoie le nombre de consonnes*)
let nbr_cons str =
 ( String.length str ) - nbr_voys str 0 (String.length str) - nbr_space str 0 (String.length str) ;;

(*Thread qui change la valeur de la proprieté innerHTML de l'element deg avec le nombre de consonnes de la string passée en parametre*)
let nbr_cons2 = fun n deg->
 let r = ref 1
 in while !r < 10000000 do
      print_int !r ;
      print_string " " ;
      r := !r+1
    done ;
 (Lwt.return(deg##.innerHTML := (Js.string (string_of_int(nbr_cons n)))))


(*Thread qui change la valeur de la proprieté innerHTML de l'element deg avec le nombre de voyelles de la string passée en parametre*)
let nbr_voys2 = fun n deg->
  let r = ref 1
 in while !r < 1000000 do
      print_int !r ;
      print_string " " ;
      r := !r+1
    done ;
 (Lwt.return(deg##.innerHTML := (Js.string (string_of_int(nbr_voys n 0 (String.length n))))))
let button_enable_t b =
  (Lwt.return(button_enable b;))

(*La fontion qui prend en paramètre un objet bouton, un objet input et un objet <p> puis lance les deux thread qui affiche le nombre de voyelles et le nombre de consonnes et attend pour qu'elles se terminent*)
let clicked i deg deg2=
  button_disable b;
  Lwt_main.run (Lwt.bind (Lwt.return(Js.to_string(i##.value))) (fun s -> Lwt.bind (Lwt.join [((nbr_voys2 s deg)) ; (nbr_cons2 s deg2)]) (fun() -> (button_enable_t b))))

(*Dans le champs handler du bouton on met la fonction que l'on vient de créer qui nous permet donc de définir la fonction clicked comme une action qui se declenche*)
let converterC_handler =
  Dom_html.handler begin
  fun evt -> (
       clicked i d d2;
    Js._true)
  end


let ()= btn##.onclick := converterC_handler (*On declenche l'action que l'on a definie en cliquant sur le bouton en mettant ce handler dans le champs 'onclick' du bouton*)

