(* Exemple avce un seul producteur et un seul consommateur *)


let x = ref 5 ;;

let entrer =
  match !x with
  |5 -> print_string "plus de places pour moi"
  |_ ->print_string "je rentre" ;x=!x+1;;

let sortire =
  print_string "je sors";;


entrer();

