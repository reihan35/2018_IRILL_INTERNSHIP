open Js ;;
open JSOO ;;
open Html;;

(* Une fonction qui permet de créer les input qui n'accepte que des float pour que l'utilisateur puisse insérer le degré Celsius ou Fahrenheit qui'il souhaite convertir *)
let float_input name id value =
  let res = Js.Fragment.create () in
    Js.Fragment.append res (Js.Node.text name) ;
    let input = Js.Node.element "input" in
      Js.Node.set_attribute input "id" id ;
      Js.Node.set_attribute input "type" "text" ;
      Js.Node.set_attribute input "value" (string_of_float !value) ;
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

let _ =
  let body = Node.document >>> get "body" in (*On récupère le noeud correspondant à l'élément body*)
   let (b,b2) = float_input "Entrez le degré en en °C :" "textF" (ref 27.0) in
   Js.Fragment.flush body b2; (*On décalre l'input initialisé comme fils du noeud body*)
   let (count3,count4) = (p "count2") in
   Js.Fragment.flush body count4;(*On crée un noeud p et on le 'append' à body *)
   Node.append count3 (Node.text "80.6 °F"); (*On crée un noeud text simple et on le 'append' à p *)
   (*Quand on click sur le bouton la fonction enlève le noeud text dejà présent et il le met à jour avec un noeud text simple contentant la valeur convertie *)
   Js.Fragment.flush body (button "Convertis !" "clickme" (fun() ->(Node.remove count3 (Node.child count3 0));(Node.append count3 (Node.text ((string_of_float((float_of_string(Js.Node.get_attribute b "value"))*.1.8+.32.0))^"°F")))));

   (*On répète exactement le même schéma pour le deuxième bouton*)
   let (b3,b4) = float_input "Entrez le degré en °F :" "textF2" (ref 80.6) in
   Js.Fragment.flush body b4;
   let (count1,count2) = (p "count") in
   Js.Fragment.flush body count2;
   Node.append count1 (Node.text "27 °C");
   Js.Fragment.flush body (button "Convertis !" "clickme2" (fun() ->(Node.remove count1 (Node.child count1 0));(Node.append count1 (Node.text ((string_of_float(((float_of_string(Js.Node.get_attribute b3 "value"))-.32.0)/.1.8))^"°C")))));
