(* $Id: oAvl.ml,v 1.2 2006/07/16 13:39:32 emmanuel Exp $ *)

exception Failure of string;;
let failwith s = raise (Failure s);;
let rec it_list f r l = match l with [] -> r | h::t -> it_list f (f r h) t
;;


let list_it f l b =
  let rec list_it_f = function [] -> b | (a::l) -> (f a (list_it_f l))
  in
     list_it_f l;;


(*  Author:  Guy Cousineau                                             *)
(*  Creation: 18/6/923                                                 *)
(*  Updates:							       *)
(*  This file contains a bench using avl trees                         *)


(* A type to deal with preorders  *)
type comparison = Smaller | Equiv | Greater;;

(* Turns a pair (lt,eq)  (strict order + equivalence
into a preorder   *)

(*
let mk_order ord  (x,y) =
   if ord x y  then Smaller
              else if x=y  then Equiv else Greater;;   (* OK *)
*)

let mk_preorder(lt,eq) (x,y) =
   if lt x y  then Smaller
              else if eq x y  then Equiv else Greater;;

(*  Various ad-hoc functions *)
let inv_rel c = function (x,y) -> match c(x,y) with
                                    Smaller -> Greater
                                  | Greater -> Smaller
                                  | Equiv   -> Equiv;;
let app_left f (x,y) =(f x,y);;
let app_right f (x,y) =(x,f y);;
let app_both f (x,y) = (f x,f y);;

type equiv_option = Take_Old | Take_New | Abort;;


let max_int x1 x2 = if x1 < x2 then x2 else x1;;
let id x=x;;

(*
let int_comp = mk_preorder(prefix <,prefix =);;
*)

(* #infix "o";; *)
let  o f g x = f(g x);;


(*  The type for binary trees *)
type 'a btree = Empty | Bin of 'a btree_node
and 'a btree_node = {info:'a ; left:'a btree ; right:'a btree};;


(*  various binary trees iterators  *)			 
				   

let rec btree_it f t x =
match t with 

   Empty ->  x
| Bin {info=a;left=t1;right=t2} 

       ->  btree_it f t1 (f a (btree_it f t2 x));;

let rec it_btree f x =
function
   Empty     -> x
| Bin {info=a;left=t1;right=t2}  

           ->  it_btree f  (f (it_btree f x t1) a) t2;;

let rec pre_btree_it f t x =
match t with 

   Empty ->  x
| Bin {info=a;left=t1;right=t2} 

       ->  pre_btree_it f t1 (pre_btree_it f t2 (f a x));;

let rec pre_it_btree f x =
function
   Empty     -> x
| Bin {info=a;left=t1;right=t2}  

           ->  pre_it_btree f  (pre_it_btree f (f x a) t1) t2;;

let rec post_btree_it f t x =
match t with 

   Empty ->  x
| Bin {info=a;left=t1;right=t2} 

       ->  f a (post_btree_it f t1 (post_btree_it f t2 x));;

let rec post_it_btree f x =
function
   Empty     -> x
| Bin {info=a;left=t1;right=t2}  

           ->  f (post_it_btree f  (post_it_btree f x t1) t2) a;;


(*  General tree  depth-first traversals   *)
type orientation = Left_to_right | Right_to_left;;
type visit_order = Prefix | Infix | Postfix;;
let flat_btree spec f t = 

  let consf = fun x l -> f x :: l
  and xconsf = fun l x -> f x :: l
  in
    match spec with
      (Left_to_right,Prefix)    -> pre_btree_it consf t []
    | (Left_to_right,Infix) -> btree_it consf t []
    | (Left_to_right,Postfix)   -> post_btree_it consf t []
    | (Right_to_left,Prefix)    -> pre_it_btree xconsf [] t
    | (Right_to_left,Infix) -> it_btree xconsf [] t
    | (Right_to_left,Postfix)   -> post_it_btree xconsf [] t;;


let btree_hom f  v  = 
let rec hom = function
     Bin {info=a;left=t1;right=t2}
         -> f(a,hom t1,hom t2)
  |  Empty -> v in
hom;;
  

let btree_depth x = btree_hom  (fun (_,x1,x2) -> 1+ max_int x1 x2) 0 x;;
(* let btree_size =  btree_hom (fun (_,x1,x2) -> 1+x1+x2) 0;; *)
let rec btree_size  =
function     Empty ->  0
  | (Bin {info=a;left=t1;right=t2} )
       ->  1+btree_size t1+btree_size t2;;


let map_btree f = btree_hom
                    (fun (a,t1,t2) -> Bin{info=f a;left=t1;right=t2})
                    Empty;;

let mirror_btree x = btree_hom
                     (fun (a,t1,t2) -> Bin{info=a;left=t2;right=t1})
                     Empty x;;


let btree_trav f g  = 
let rec trav n = 

function
     Bin {info=a;left=t1;right=t2}
         -> f(n,a,trav (n+1) t1,trav (n+1) t2)
  |  Empty -> g(n)
in trav 0;;


let do_btree spec h t=
  let h1 x y = h x;()
  and h2 x y = h y;()
  in
    match spec with
      (Left_to_right,Prefix)    -> pre_it_btree h2 () t
    | (Left_to_right,Infix)     -> it_btree h2 () t
    | (Left_to_right,Postfix)   -> post_it_btree h2 () t
    | (Right_to_left,Prefix)    -> pre_btree_it h1 t ()
    | (Right_to_left,Infix)     -> btree_it h1 t ()
    | (Right_to_left,Postfix)   -> post_btree_it h1 t ();;



let do_btree_left f = 
let rec do_b =
function
  Empty   ->   ()
| Bin {info=a;left=t1;right=t2}  

    ->  do_b t1;f a; do_b t2
in do_b;;

let do_btree_right f = 
let rec do_b =
function
  Empty   ->   ()
| Bin {info=a;left=t1;right=t2}  

    ->  do_b t2;f a; do_b t1
in do_b;;


(*  Functions for binary search trees  *)
(*  The firts argument is a preorder   *)

let rec is_bst c =
 function  Empty  -> true
(*         | Bin {info=_;left=Empty;right=Empty}   

               ->  true  *)
	|   Bin{info=x;left=(Bin{info=y;} as t);right=Empty}
               -> not(c(y,x)=Greater) & is_bst c t
	|   Bin{info=x;left=Empty;right=(Bin{info=y;} as t)}
               -> not(c(x,y)=Greater) & is_bst c t
	|   Bin{info=x;left=(Bin{info=y;} as t1);
                   right=(Bin{info=z;} as t2)}
               -> not(c(y,x)=Greater) & not(c(x,z)=Greater)
                    & is_bst c t1 & is_bst c t2;;


let find_bst comp answer e = 
let rec search =
function    Empty    ->  failwith  "binary search failed"
       | Bin{info=x;left=t1;right=t2}  

            ->  match comp(e,x) with
                   Equiv -> answer x
                | Smaller -> search t1
                | Greater -> search t2
in search;;

let belongs_to_bst comp  e = 
let  rec search =
function    Empty    ->  false
       | Bin{info=x;left=t1;right=t2}  

            ->  match comp(e,x) with
                   Equiv -> true
                | Smaller -> search t1
                | Greater -> search t2
in search;;


let change_bst comp modify e = 
let rec change =
function    Empty    ->  failwith  "binary search failed"
       | Bin{info=x;left=t1;right=t2}  

            ->  (match comp(e,x) with
                  Equiv  ->  Bin{info=modify x;left=t1;right=t2}  

                | Smaller -> Bin{info=x;left= change t1;right=t2}
                | Greater -> Bin{info=x;left=t1;right=change t2})
in change;;


let rec add_bottom_to_bst opt comp t e = 
let rec add =
function
  Empty   ->   Bin{info=e;left=Empty;right=Empty}
| (Bin{info=x;left=t1;right=t2} as t)
    -> (match comp(e,x),opt with
          (Equiv,Abort) -> failwith "Abort due to equiv option"
        | (Equiv,Take_Old) -> t
        | (Equiv,Take_New) -> Bin{info=e;left=t1;right=t2}
        | (Smaller,_) -> Bin{info=x;left=add t1;right=t2}
        | (Greater,_) -> Bin{info=x;left=t1;right=add t2})
in add t;;

   

let add_list_bottom_to_bst opt c = 

        it_list (add_bottom_to_bst opt c);;

let mk_bst opt c  = add_list_bottom_to_bst opt c Empty;;


let rec remove_biggest =  

function
  Bin{info=a;left=t1;right=Empty}   

        ->   (a,t1)
| Bin{info=a;left=t1;right=t2}     

        ->   let  (a_prime,t_prime) = remove_biggest t2
             in  (a_prime, Bin{info=a;left=t1;right=t_prime})
| Empty   -> failwith "Cannot remove element from empty tree";;
				      

let  rec rem_root_from_bst comp   = 

function
   Empty    ->    failwith  "binary search failed"
|  Bin {info=_;left=t1;right=t2} 

            -> let  (a_prime,t_prime) = remove_biggest  t1
               in   Bin{info=a_prime;left=t_prime;right=t2};;

let  rec rem_from_bst comp e  = 
let  rec rem =
function
   Empty    ->    failwith  "binary search failed"
|  (Bin {info=a;left=t1;right=t2} as t)
            -> 

      (match comp(e,a) with
       Equiv ->  rem_root_from_bst comp t
     | Smaller ->   Bin{info=a;left= rem t1;right= t2}
     | Greater ->   Bin{info=a;left=t1;right= rem t2})
in rem;;
					      

let rem_list_from_bst c = list_it (rem_from_bst c);;


let rec cut_bst comp e =
let rec cut =
function
   Empty   -> (Empty,e,Empty)
| Bin{info=a;left=t1;right=t2}  

       -> (match comp(e,a) with
             Smaller   ->  let (t,e_prime,t_prime) = cut t1
                           in (t,e_prime,Bin{info=a;left=t_prime;right=t2})
           | Equiv     ->  (t1,a,t2)
           | Greater   -> let (t,e_prime,t_prime) = cut t2
                          in (Bin{info=a;left=t1;right=t},e_prime,t_prime))
in cut
;;
					  

					  

let add_root_to_bst opt comp e b =
   let  t1,e_prime,t2 = cut_bst comp e b 

   in  Bin{info=(match opt
                 with Take_Old  -> e_prime
                  |   Take_New  -> e
                  |   Abort     -> failwith "Abort due to equiv option");
           left=t1;
           right=t2};;
   

let mk_bst2 opt c l  = list_it (add_root_to_bst opt c) l Empty;;



(*  Balanced binary trees  (AVL  *)
				  

type balance = Left | Balanced | Right;;

(* type 'a avltree == ('a * balance) btree;; *)

let balance =
function Bin{info=(_,b);} -> b
      |  Empty -> Balanced;;

let rec is_avl c = is_bst (o c  (app_both fst));;

let find_avl comp answer = 

   find_bst (o comp  (app_right fst))
            (o answer  fst) ;;

let belongs_to_avl comp  = 

   belongs_to_bst (o comp (app_right fst));;

let change_avl comp modify =
  change_bst (o comp  (app_right fst))
             (app_left modify);;

let flat_avl spec f = flat_btree spec (o f fst);;
let map_avl f = map_btree (app_left f);;
let do_avl spec h = do_btree spec (app_left h);;

let mirror_avl x = btree_hom
                  (fun ((x,b),t1,t2) 

                     ->
                   let b_prime = match b with
                                     Left     ->   Right
                                   | Balanced -> Balanced
                                   | Right    ->   Left
		   in  Bin{info=(x,b_prime);left=t2;right=t1})
                  Empty x;;



(* "Rotations "  *)

(* rotate right *)
let  rd (Bin{info=(q,_);
              left=Bin{info=(p,b);left=u;right=v};
              right=w})
=  match b with 

 Balanced ->  Bin{info=(p,Right);
                      left=u;
                      right=Bin{info=(q,Left);left=v;right=w}}
|  Left ->  Bin{info=(p,Balanced);
                left=u;
                right=Bin{info=(q,Balanced);left=v;right=w}};;

(* rotate left *)
let  rg (Bin{info=(p,_);
             left=u;
             right=Bin{info=(q,b);left=v;right=w}})
=  match b with 

 Balanced  ->  Bin{info=(q,Left);
                   left=Bin{info=(p,Right);left=u;right=v};
                   right=w}
|  Right   ->  Bin{info=(q,Balanced);
                   left=Bin{info=(p,Balanced);left=u;right=v};
                   right=w};;

(* rotate left right *)
let  rgd (Bin{info=(r,_);
              left=Bin{info=(p,_);
                       left=t;
                        right=Bin{info=(q,b);left=u;right=v}};
              right=w})
= match b with
  Left     ->   Bin{info=(q,Balanced);
                    left=Bin{info=(p,Balanced);left=t;right=u};
                    right=Bin{info=(r,Right);left=v;right=w}}
| Right    ->   Bin{info=(q,Balanced);
                    left=Bin{info=(p,Left);left=t;right=u};
                    right=Bin{info=(r,Balanced);left=v;right=w}}
| Balanced ->   Bin{info=(q,Balanced);
                    left=Bin{info=(p,Balanced);left=t;right=u};
                    right=Bin{info=(r,Balanced);left=v;right=w}};;


(* rotate right left*)
let rdg (Bin{info=(r,_);
              left=t;
              right=Bin{info=(p,_);
                         left=Bin{info=(q,b);left=u;right=v};
                         right=w}})   

= match b with 

    Left   ->  Bin{info=(q,Balanced);
                   left=Bin{info=(r,Balanced);left=t;right=u};
                   right=Bin{info=(p,Right);left=v;right=w}}
|  Right   ->  Bin{info=(q,Balanced);
                   left=Bin{info=(r,Left);left=t;right=u};
                    right=Bin{info=(p,Balanced);left=v;right=w}}
| Balanced ->  Bin{info=(q,Balanced);
                    left=Bin{info=(r,Balanced);left=t;right=u};
                    right=Bin{info=(p,Balanced);left=v;right=w}};;



type avl_modification1 = No_mod | Incleft | Incright;;


let rec add_to_avl opt comp t e = 
let rec add =
function Empty 

    -> Bin{info=(e,Balanced);left=Empty;right=Empty},Incleft 

| (Bin{info=(x,b);left=t1;right=t2} as t)


    ->
  (match (comp(e,x),opt,b) with
    (Equiv,Abort,_) -> failwith "Abort due to merging option"
  | (Equiv,Take_Old,_) -> t,No_mod
  | (Equiv,Take_New,_) -> Bin{info=(e,b);left=t1;right=t2},No_mod
  | (Smaller,_,Balanced)
     -> let t,m = add t1 

        in if m=No_mod 

              then Bin{info=(x,Balanced);left=t;right=t2},No_mod 

              else Bin{info=(x,Left);left=t;right=t2},Incleft 

  | (Greater,_,Balanced)
     -> let t,m = add t2 

        in if m= No_mod 

              then Bin{info=(x,Balanced);left=t1;right=t},No_mod
              else Bin{info=(x,Right);left=t1;right=t},Incright 

  | (Greater,_,Left)
     -> let t,m = add t2 

        in if m=No_mod 

              then Bin{info=(x,Left);left=t1;right=t},No_mod 

              else Bin{info=(x,Balanced);left=t1;right=t},No_mod 

  | (Smaller,_,Left)
     -> let t,m = add t1 

        in (match m with 

             No_mod -> Bin{info=(x,Left);left=t;right=t2},No_mod 

           | Incleft 

               -> rd (Bin{info=(x,Balanced);left=t;right=t2}),No_mod 

           | Incright 

               -> rgd(Bin{info=(x,Balanced);left=t;right=t2}),No_mod)
  | (Smaller,_,Right)
     ->  let t,m = add t1 

         in if m= No_mod 

               then Bin{info=(x,Right);left=t;right=t2},No_mod 

               else Bin{info=(x,Balanced);left=t;right=t2},No_mod 

  | (Greater,_,Right)
     ->  let t,m = add t2
         in (match m with 

              No_mod -> Bin{info=(x,Right);left=t1;right=t},No_mod 

            | Incleft 

                -> rdg(Bin{info=(x,Balanced);left=t1;right=t}),No_mod 

            | Incright 

                -> rg(Bin{info=(x,Balanced);left=t1;right=t}),No_mod))
in fst(add t);;



let add_list_to_avl opt c = it_list (add_to_avl opt c);;
let mk_avl opt c  = add_list_to_avl opt c Empty;;
let merge_avl opt c  = it_btree
                        (fun t x -> add_to_avl opt c t (fst x));;

let avl_sort c = o (flat_avl (Left_to_right,Infix) id) 

                            (mk_avl Take_Old c);;



let balance_right (x,t,t_prime) =
match balance t with
  (Left )  ->  rd  (Bin{info=(x,Balanced);left=t;right=t_prime})
| Balanced  ->  rd  (Bin{info=(x,Balanced);left=t;right=t_prime})
|      Right         ->  rgd (Bin{info=(x,Balanced);left=t;right=t_prime});;

let balance_left (x,t,t_prime) =
match balance t_prime with
  (Right )  ->  rg  (Bin{info=(x,Balanced);left=t;right=t_prime})
| Balanced  ->  rg  (Bin{info=(x,Balanced);left=t;right=t_prime})
|      Left           ->  rdg (Bin{info=(x,Balanced);left=t;right=t_prime});;

type avl_modification2 = No_modP | Dec;;

let rec remove_biggestP =  function
  Bin{info=(a,_);left=t1;right=Empty} -> (a,t1,Dec)
| Bin{info=(a,Balanced);left=t1;right=t2}
   ->  

   let  (a_prime,t_prime,b) = remove_biggestP t2
   in  (match b with
          Dec   -> (a_prime, Bin{info=(a,Left);left=t1;right=t_prime},No_modP)
        | No_modP -> (a_prime, Bin{info=(a,Balanced);left=t1;right=t_prime},No_modP))
| Bin{info=(a,Right);left=t1;right=t2}
   ->  

   let  (a_prime,t_prime,b) = remove_biggestP t2
   in  (match b with
           Dec   ->  (a_prime, Bin{info=(a,Balanced);left=t1;right=t_prime},No_modP)
        | No_modP ->  (a_prime, Bin{info=(a,Right);left=t1;right=t_prime},No_modP))
| Bin{info=(a,Left);left=t1;right=t2}
   ->   

   let  (a_prime,t_prime,b) = remove_biggestP t2
   in  (match b with
           Dec   ->  (a_prime, Bin{info=(a,Balanced);left=t1;right=t_prime},No_modP)
        | No_modP ->  (a_prime, balance_right (a,t1,t_prime),Dec))
| Empty -> failwith "Cannot remove element from empty avl";;




let rec remove_from_avl comp t e = 
let  rec remove =
function
    Empty          ->  failwith "search failed in avl tree"
| Bin{info=(a,b);left=t1;right=t2}  

    -> 

  match comp(e,a) with
    Equiv  ->  

    if t1=Empty then t2,Dec
       else let (a_prime,t_prime,m) = remove_biggestP t1
             in (match m with
                   No_modP -> Bin{info=(a_prime,b);left=t_prime;right=t2},No_modP
                 |  Dec -> (match b with
                             Balanced -> Bin{info=(a_prime,Right);
                                             left=t_prime;
                                             right=t2},No_modP
                             | Left   -> Bin{info=(a_prime,Balanced);
                                             left=t_prime;
                                             right=t2},Dec
                             | Right  -> balance_left(a_prime,t_prime,t2),Dec))
  | Smaller ->  

    let t_prime,m = remove t1
    in  (match m with
           No_modP -> Bin{info=(a,b);left=t_prime;right=t2},No_modP
         | Dec  -> (match b with
                     Balanced -> Bin{info=(a,Right);
                                     left=t_prime;
                                     right=t2},No_modP
                    |  Left   -> Bin{info=(a,Balanced);
                                     left=t_prime;
                                     right=t2},Dec
                      |  Right -> balance_left(a,t_prime,t2),
                                 if balance t2 = Balanced
                                    then No_modP else Dec))
  | Greater -> 

    let t_prime,m = remove t2
    in  (match m with
           No_modP  ->  Bin{info=(a,b);left=t1;right=t_prime},No_modP
         | Dec -> (match b with
                    Balanced -> Bin{info=(a,Left);
                                    left=t1;
                                    right=t_prime},No_modP
                   | Right   -> Bin{info=(a,Balanced);
                                    left=t1;
                                    right=t_prime},Dec
                   |  Left   -> balance_right(a,t1,t_prime),
                                if balance t2=Balanced
                                   then No_modP else Dec))
in fst (remove t);;

let remove_list_from_avl r  = it_list (remove_from_avl r);;

let rec subtract_from_avl comp t e = 

   try remove_from_avl comp t e
   with  _  -> t;;
   

   

   

 



type 'a set = {set_elements: ('a * balance) btree;
                set_order:('a * 'a) -> comparison};;
                

let cardinal s = btree_size s.set_elements;;

let make_set c l = {set_elements=mk_avl Take_Old c l;
                  set_order=c};;
                  

let make_emptyset c =  make_set c [];;
                  

let set_isempty s = (s.set_elements=Empty);;

let set_member x s =
   belongs_to_avl  s.set_order x s.set_elements;;
   

let set_it f s =  btree_it (fun x y  -> f (fst x) y)
                            s.set_elements;;
   

let it_set f x s = it_btree (fun x y  -> f x (fst y))
                            x
                            s.set_elements;;
                            

let add_to_set s x = {set_elements= add_to_avl Take_Old 

                                       s.set_order s.set_elements x;
                      set_order=s.set_order};;

let add_list_to_set x = it_list add_to_set x;;



let remove_from_set s x = 

   try  {set_elements= remove_from_avl 

                           s.set_order s.set_elements x;
         set_order=s.set_order}
   with _ -> failwith "set: cannot remove a non-existing element";;
                            

                            

let subtract_from_set s x = 

   try  remove_from_set s x
   with  _ -> s;;
   

   

let set_union s1 s2 =
  if not(s1.set_order = s2.set_order)
    then failwith "set_union: different set orders"
    else  it_set add_to_set s1 s2;;


let set_diff s1 s2 =
  if not(s1.set_order = s2.set_order)
    then failwith "set_diff: different set orders"
    else  it_set subtract_from_set s1 s2;;
           

let set_intersection s1 s2 = set_diff s1 (set_diff s1 s2);;

let sub_set s1 s2 = set_isempty (set_diff s1 s2);;



           

let list_of_set s = flat_avl (Left_to_right,Infix) id s.set_elements;;

let do_set f s = do_btree (Left_to_right,Infix)
                          (app_left f)
                          s.set_elements;;

let print_set print_elem s=
  do_set (fun x -> print_elem  x; print_string " ") s;;







(* let I x = x;;*)


let rec find p =
  function []  ->  failwith "not_found"
   | (a::l) ->  if (p a) then a else find p l;;

let rec loop p f x = if (p x) then x
                              else loop p f (f x);;


let n=ref (-1);;
let rec loopn p f x = if (p x) then x
                              else (n:=!n+1;print_int !n;
                                    print_newline();loopn p f (f x));;


(* recherche breadth-first d'une solution
avec memorisation des configurations
rencontrees: 

On commence par definir une fonction "add_archive"
qui joue le meme role que la fonction "flat_map"
mais qui ajoute une archivation des configurations
rencontrees.
Alors que "flat_map"  est de type
('a -> 'b list) -> 'a list -> 'b list,
"add_archive" est essentiellement de type
('a -> 'b list) -> 'c * 'a list -> 'c * 'b list
ou` 'c est le type de l'archive.
En fait, "add_archive" est parame'tre'e par les
fonctions permettant de d'utiliser l'archive
c'est-a`-dire les fonction 

  - de test d'appartenance a` l'archive
  - d'ajout d'un e'le'ment a` l'archive
  - d'extraction a` partir des configurations de
    la partie qui doit e^tre archive'e
"add_archive" posse`de donc le type
('a -> 'b -> bool) * ('b -> 'a list -> 'b) * ('c -> 'a) 

    -> ('d -> 'c list) -> 'b * 'd list -> 'b * 'c list
*)


let partition test l =
   let switch elem (l1,l2)   = 

        if test elem then (l1,elem::l2)
	             else (elem::l1,l2)
   in list_it switch l ([],[]);;

(*let rec all p =
     fun   [] -> []
      |  (a::l) 

           -> if p a
               then a::all p l 

               else all p l;;
  *)

let all p = o snd  (partition p);;

(* *** AJOPUT *** *)
let rec map f l = match l with [] -> [] | h::t -> (f h)::(map f t);;
let exists p =  
let rec exists_p = function
     [] -> false | a::l -> p a or exists_p l
in exists_p 
;;


let add_archive (belongs,add,arch_part) f (arch,l) =
let  rec frec  arch ll =
  function []   ->   (arch,ll)
   | (c::cl) 

       -> let ll_prime = all (fun c -> not(belongs (arch_part c) arch)) (f c)
          in frec (add arch (map arch_part ll_prime)) (ll_prime@ll) cl
in    frec arch [] l;;


let find_one_shortest_solution trace (ok,pos_moves,display_result) 

             (belongs,add,arch_part,empty) start =

  (display_result ok
    ((if trace then (n:=0;loopn) else loop)
          (o (exists  ok)   snd)
          (add_archive (belongs,add,arch_part) pos_moves) 

          (add empty (map arch_part start),start)))
;;

(*   JEUX    THAILANDAIS   *)


(* type cell== int*int;;*)
type direction = LeftP | Up | RightP | Down;;
(* type thai_move == (int * int)  * direction;; *)


type board =
  {king: (int *int);
   knights: (int *int) list;
   hdef: (int *int);
   vdefs: (int *int) list};;
type piece = King | Knight | Hdef | Vdef | None;;

(* AJOUT *)

let equal_cell (a,b) (c,d) = (a=c) & (b=d);;
let mem x = 
let rec mem_x = function
     [] -> false | y::l -> (equal_cell x y) or mem_x l
in mem_x
;;

(* PB cell board.vdefs *)

let get cell board =
 if equal_cell board.king  cell then King
 else if equal_cell board.hdef  cell then Hdef
      else if mem cell board.knights then Knight
            else if mem cell board.vdefs then Vdef
                 else None;;


let besides ((l1,c1),(l2,c2))=
   l1=l2 & c2=c1+1;;

let over ((l1,c1),(l2,c2))=
   c1=c2 & l2=l1+1;;

let up (i,j) = (i-1,j);;
let left (i,j) = (i,j-1);;
let down (i,j) = (i+1,j);;
let right (i,j) = (i,j+1);;
let up2 (i,j) = (i-2,j);;
let left2 (i,j) = (i,j-2);;
let down2 (i,j) = (i+2,j);;
let right2 (i,j) = (i,j+2);;

let rec update x y =
 function    []   ->   []
  |   (a::l) ->  if equal_cell x a then y::l
                        else a::update x y l;;




let int_comp2 (i1,i2)
  = if i1<i2 then Smaller
     else if i1 > i2 then Greater
       else Equiv;;

let cell_comp ((i1,j1),(i2,j2))
  = match int_comp2 (i1,i2)
    with Smaller -> Smaller
     |   Greater -> Greater
     |   Equiv -> int_comp2 (j1,j2);;

let rec cell_list_comp =
  function    ([],[])   ->   Equiv
   |  (c1::cl1,c2::cl2) 

     ->  match cell_comp (c1,c2)
         with Smaller    ->   Smaller
          |   Greater    ->   Greater
          |    Equiv     ->  cell_list_comp (cl1,cl2);;


let thai_comp (c1,c2) =
  match cell_comp(c1.king,c2.king)
  with  Smaller   ->  Smaller
    |   Greater   ->  Greater
    |    Equiv  

     ->  

  match cell_comp(c1.hdef,c2.hdef)
  with  Smaller   ->  Smaller
    |   Greater   ->  Greater
    |    Equiv  

     ->  

  match cell_list_comp(c1.knights,c2.knights)
  with  Smaller   ->  Smaller
    |   Greater   ->  Greater
    |    Equiv  

     ->  

  match cell_list_comp(c1.vdefs,c2.vdefs)
  with  Smaller   ->  Smaller
    |   Greater   ->  Greater
    |    Equiv  ->  Equiv;;


let rec insert comp x =
 function [] ->  [x]
  | ((a::l) as l_prime)
    -> match comp(x,a)
       with  (Smaller) ->  x::l_prime
       |Equiv  ->  x::l_prime
        |      Greater   ->  a::insert comp x l;;

let sort comp l = list_it (insert comp) l [];;

let order_pair ((p1,p2) as p) =
 match cell_comp p
 with  (Smaller)  -> p
 | Equiv -> p
  |        Greater  ->   (p2,p1);;


let moves1 (ml,((b,b_prime),board) )
= (match get (right b) board
   with  Knight  ->  [((b,LeftP)::ml,(order_pair(right b,b_prime),
                      {king=board.king;
                       knights= sort cell_comp (update (right b) b 

board.knights);
                       hdef=board.hdef;vdefs= board.vdefs}))]
    |    Hdef    ->  [((b,LeftP)::ml,(order_pair(right2 b,b_prime),
                      {king=board.king;knights= board.knights;
                       hdef=b;vdefs= board.vdefs}))]
    |     _      ->  [])
   @
   (match get (down b) board
   with  Knight  ->  [((b,Up)::ml,(order_pair(down b,b_prime),
                      {king=board.king;
                       knights=update (down b) b board.knights;
                       hdef=board.hdef;vdefs= board.vdefs}))]
    |    Vdef    ->  [((b,Up)::ml,(order_pair(down2 b,b_prime),
                      {king=board.king;knights= board.knights;
                       hdef=board.hdef;vdefs= sort cell_comp (update (down 

b) b board.vdefs)}))]
    |     _      ->  [])
    @
    (match (get (left b) board,get (left2 b) board)
   with  (Knight,_)  ->  [((b,RightP)::ml,(order_pair(left b,b_prime),
                          {king=board.king;
                           knights=sort cell_comp (update (left b) b 

board.knights);
                           hdef=board.hdef;vdefs= board.vdefs}))]
    |    (_,Hdef)    ->  [((b,RightP)::ml,(order_pair(left2 b,b_prime),
                          {king=board.king;knights= board.knights;
                           hdef=left b;vdefs= board.vdefs}))]
    |     _      ->  [])
   @
   (match (get (up b) board,get (up2 b) board)
   with  (Knight,_)  ->  [((b,Down)::ml,(order_pair(up b,b_prime),
                          {king=board.king;
                           knights=sort cell_comp (update (up b) b 

board.knights);
                           hdef=board.hdef;vdefs= board.vdefs}))]
    |    (_,Vdef)    ->  [((b,Down)::ml,(order_pair(up2 b,b_prime),
                          {king=board.king;knights= board.knights;
                           hdef=board.hdef;
                           vdefs= sort cell_comp (update (up2 b) (up b) 

board.vdefs)}))]
    |     _      ->  []);;

let moves2 (ml,((b,b_prime),board) )
= if not(besides (b,b_prime)) & not(over (b,b_prime)) 

    then []
    else if besides (b,b_prime)
         then  (match (get (up b) board,get (up2 b) board)
                with  (_,King)  

                      ->  [((b,Down)::ml,((up2 b,up2 b_prime),
                          {king=up b;knights=board.knights;
                           hdef=board.hdef;vdefs= board.vdefs}))]
                  |    (Hdef,_)    

                      ->  [((b,Down)::ml,((up b,up b_prime),
                          {king=board.king;knights= board.knights;
                           hdef=b;vdefs= board.vdefs}))]
                  |     _      ->  [])
                @
               (match get (down b) board
                with  King  

                      ->  [((b,Up)::ml,((down2 b,down2 b_prime),
                          {king=b;knights=board.knights;
                           hdef=board.hdef;vdefs= board.vdefs}))]
                  |   Hdef   

                      ->  [((b,Up)::ml,((down b,down b_prime),
                          {king=board.king;knights= board.knights;
                           hdef=b;vdefs= board.vdefs}))]
                  |     _      ->  [])
         else if over (b,b_prime)
         then  (match (get (left b) board,get (left2 b) board)
                with  (_,King)  

                      ->  [((b,RightP)::ml,((left2 b,left2 b_prime),
                          {king=left b;knights=board.knights;
                           hdef=board.hdef;vdefs= board.vdefs}))]
                  |    (Vdef,_)    

                      ->  [((b,RightP)::ml,((left b,left b_prime),
                          {king=board.king;knights= board.knights;
                           hdef=board.hdef;
                           vdefs= sort cell_comp (update (left b) b 

board.vdefs)}))]
                  |     _      ->  [])
                @
               (match get (right b) board
                with  King  

                      ->  [((b,LeftP)::ml,((right2 b,right2 b_prime),
                          {king=b;knights=board.knights;
                           hdef=board.hdef;vdefs= board.vdefs}))]
                  |   Vdef   

                      ->  [((b,LeftP)::ml,((right b,right b_prime),
                          {king=board.king;knights= board.knights;
                           hdef=board.hdef;
                           vdefs= sort cell_comp (update (right b) b 

board.vdefs)}))]
                  |     _      ->  [])
            else [];;









let thai_game_pos_moves (ml,((b,b_prime),board))=
  (moves1 (ml,((b,b_prime),board))) @ (moves1 (ml,((b_prime,b),board)))
 @  (moves2 (ml,((b,b_prime),board))) ;;

let ok_thai c = fst((snd(snd c)).king)=4;;

let comB =((3,1),(3,4)),
       {king=1,2;
        knights=[1,1;1,4;2,1;2,4];
        hdef=3,2;
        vdefs= [4,1;4,2;4,3;4,4]};;

(* AJOUT *)
let rec rev_append l l_prime = match (l,l_prime) with 
      ([],l_prime) -> l_prime
  | ((a::l), l_prime) -> rev_append l (a::l_prime)
;;

let rev l = rev_append l []
;;
let display_thai_result ok c=
  rev(fst (find ok (snd c)));;


let find_one_shortest_solution_for_thai_game ok start=
find_one_shortest_solution true
         (ok ,thai_game_pos_moves,display_thai_result)
         (set_member , 

          add_list_to_set ,
          o snd  snd,
          make_emptyset thai_comp)
         [[],start];;

find_one_shortest_solution_for_thai_game ok_thai comB ;;

