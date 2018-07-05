let now () = (new%js Js.date_now)##getTime in 
let p1 = now() in

let win = Dom_html.window in
  
win##alert(Js.string "hello");

let p2 = now() in

win##alert(Js.string ("It took "^(string_of_float (p2-.p1)^".ms")))
