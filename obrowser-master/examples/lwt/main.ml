(*open Graphics;;

let _ =
  Js.Node.append (Js.get_element_by_id "body") (open_graph 1000 1000) ;
  fill_circle 12 12 10

(* let i = get_image 0 0 24 24 *)

let (>>=) = Lwt.bind

let (>>=) = Lwt.bind


(*let rec f () =
  Js.alert "salut";
  Lwt_obrowser.sleep 2. >>= f

let _ = f ()*)

let rec f x0 y0 r alpha =
  Lwt_obrowser.yield () >>= fun () ->
(*  draw_image i (x0 + truncate (r *. (cos alpha)))
    (y0 + truncate (r *. (sin alpha))); *)
  fill_circle (x0 + truncate (r *. (cos alpha)))
    (y0 + truncate (r *. (sin alpha))) 10;
  f x0 y0 r (alpha +. 0.001)

let _ = f 500 550 100. 0.
let _ = f 500 500 100. 0.

let _ = Lwt_obrowser.run (fst (Lwt.wait ()))
*)

(*Une fonction qui permet de créer les input qui n'accepte que des string pour que l'utilisateur puisse insérer le degré Celsius ou Fahrenheit qui'il souhaite convertir *)
open Js ;;
open JSOO ;;
open Html;;

let string_input name id value =
  let res = Js.Fragment.create () in
    Js.Fragment.append res (Js.Node.text name) ;
    let input = Js.Node.element "input" in
      Js.Node.set_attribute input "id" id ;
      Js.Node.set_attribute input "type" "text" ;
      Js.Node.set_attribute input "value" !value ;
      Js.Fragment.append res input ;
      (input,res) (*l'objet res permet d'ajouter des noeuds enfants au noeud input et l'onjet input nous permet d'ajouter input en tant que noeud enfant à un autre noeud *)

(* Une fonction pour créer des boutons de soumission *)
let button name id callback =
  let res = Js.Fragment.create () in
  let input = Js.Node.element "input" in
    Js.Node.set_attribute input "type" "submit" ;
    Js.Node.set_attribute input "id" id ;
    Js.Node.set_attribute input "value" name ;
    Js.Node.register_event input "onclick" callback ();
    Js.Fragment.append res input ;
    res

(* Une fonction pour créer des balises p*)
let p id =
  let res = Js.Fragment.create () in
  let div = Js.Node.element "p" in
    Js.Node.set_attribute div "id" id ;
    Js.Fragment.append res div ;
    (div,res)

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

(* Deuxieme methode *)




(* Premiere methode
(*fonction qui renvoie le nombre de consonnes*)
let nbr_cons str =
 ( String.length str ) - nbr_voys str 0 (String.length str) - nbr_space str 0 (String.length str) ;;


(*Thread qui genere un nouveau noeud (fils du noeud avec l'id passé en parametre)contentant le nombre de consonnes de la string passée en parametre*)
let nbr_cons2 = fun s id->
 Lwt_obrowser.yield(Node.append id (Node.text (string_of_int(nbr_cons s)^" consonnes\n")))


(*Thread qui genere un nouveau noeud (fils du noeud avec l'id passé en parametre)contentant le nombre de voyelles de la string passée en parametre*)
let nbr_voys2 = fun s id->
  Lwt_obrowser.yield(Node.append id (Node.text (string_of_int(nbr_voys s 0 (String.length s))^" voyelles\n")))

let _ =
  let body = Node.document >>> get "body" in (*On récupère le noeud correspondant à l'élément body*)
   let (b,b2) = string_input "Tapez le mot :" "textF" (ref "Hello") in
   Js.Fragment.flush body b2; (*On décalre l'input initialisé comme fils du noeud body*)
   let (count3,count4) = (p "count2") in
   Js.Fragment.flush body count4;(*On crée un noeud p et on le 'append' à body *)
   Node.append count3 (Node.text "2 voyelles ");(*On crée un noeud text simple et on le 'append' à p *)
   Node.append count3 (Node.text "3 consonnes");(*On crée un deuxieme noeud text simple et on le 'append' à p *)
   let (count1,count2) = (p "count") in
   Js.Fragment.flush body count2;
   let a = Array.make 1 "" in (*On cree un tableau à une seule case qui contiendera la valeur de la string que l'utilisateur tape (c'est utilisé comme effet de bord) *)
   (*Quand on click sur le bouton la fonction enlève le noeud text dejà présent et il le met à jour avec un noeud text simple contentant la valeur convertie *)
   Js.Fragment.flush body (button "Go !" "clickme" (fun() ->(Node.remove count3 (Node.child count3 0));(Node.remove count3 (Node.child count3 0));Lwt_obrowser.run(Lwt.bind (Lwt_obrowser.yield(a.(0)<-Js.Node.get_attribute b "value")) (fun s -> (Lwt.join [( nbr_cons2 a.(0) count3) ;(nbr_voys2 a.(0) count3) ])))));

(*    Js.Fragment.flush body (button "Convertis !" "clickme2" (fun() ->(Node.remove count1 (Node.child count1 0));(Node.append count1 (Node.text ((string_of_float(((float_of_string(Js.Node.get_attribute b3 "value"))-.32.0)/.1.8))^"°C"))))); *) *)


