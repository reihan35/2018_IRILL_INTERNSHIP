(* $Id: oIntegrales.ml,v 1.2 2006/07/16 13:39:32 emmanuel Exp $ *)

let (>=.) a b = a >= b;;


let integrale f a b n =
  
  let h = (b -. a) /. (float_of_int n) in
  let rec integ x =
    if  x >=.  b then 0.0 else (f x) +. integ (x +. h) in 
  integ  a *. h
;;

let poly x = x *. x
;;


let rec repeat n =
  if n <= 0 then 0.0 else (repeat (n-1); integrale poly 0.0 1.0 10000)
;;

print_float (repeat 100);
print_string "\n"
;;
print_newline();;




