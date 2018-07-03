external alert: string -> unit = "alert" [@@bs.val];;

type dom;;

external dom : dom = "document" [@@bs.val];;

type id;;
external get_by_id : dom -> string -> id = "getElementById"[@@bs.send];;
external setInnerHTML : id -> string -> unit = "innerHTML" [@@bs.send];;
external getInnerHTML : id -> string = "innerHTML" [@@bs.send];;

let clicked() =
  getInnerHTML (get_by_id dom "clickme" );;

(*let clicked x = 
  alert "hello";*)
