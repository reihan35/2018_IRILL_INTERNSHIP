let counter() =
  let cpt = ref 0 in
    (fun() -> cpt:=!cpt+1;!cpt),
    (fun() -> cpt:=0)

let win = Dom_html.window

let alert msg =
  win##alert(Js.string msg)


(*let alert_handler =
  Dom_html.handler begin
  fun evt -> (alert "Alert";
             Js._true)
  end
*)

let btn = Dom_html.getElementById "btn_alert"

let nb = Dom_html.getElementById "click_number"
let btn2 = Dom_html.getElementById "btn_click"
let opt = Dom_html.CoerceTo.button btn2
let b = Js.Opt.get opt (fun() -> failwith "erreur")
let (one_up, reinit) = counter()

let button_disable btn =
  btn##.disabled := Js._true

let button_counter nb btn =
  let cpt = one_up() in
(*     if cpt = 10 then reinit(); *)
      if cpt = 10 then (btn##.disabled := Js._true; Js._true)
    else (nb##.innerHTML := Js.string(string_of_int cpt); Js._true)

let counter_handler =
  Dom_html.handler begin
  fun evt -> (
        button_counter nb b;
    Js._true)
  end

let ()= btn2##.onclick := counter_handler
