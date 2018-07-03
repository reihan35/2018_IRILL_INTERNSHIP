let win = Dom_html.window (*initalisation de l'objet window*)

(*On utilise l'objet bouton en récupérant avec le DOM HTML l'objet qui a pour id 'clickme' puis on le 'coerce' en valuer Js_of_caml*)

let btn = Dom_html.getElementById "clickme"
let opt = Dom_html.CoerceTo.button btn
let b = Js.Opt.get opt (fun() -> failwith "erreur")

(*On récupère le dom HTML de la balise p (qui a pour id = "count")*)
let d = Dom_html.getElementById "count"


let alert msg =
  win##alert(Js.string msg)

(*On initalise l'objet input (là où l'utilisateur saisie la valeure) en récupérant avec le DOM HTML l'objet qui a pour id 'textF' puis on le 'coerce' en valuer Js_of_caml*)

let input = Dom_html.getElementById "textF"
let opt2 = Dom_html.CoerceTo.input input
let i = Js.Opt.get opt2 (fun() -> failwith "erreur")

(*On fait de même pour le deuxième bouton*)
let btn2 = Dom_html.getElementById "clickme2"
let opt3 = Dom_html.CoerceTo.button btn2
let b2 = Js.Opt.get opt3 (fun() -> failwith "erreur")

let d2 = Dom_html.getElementById "count2"

let input2 = Dom_html.getElementById "textF2"
let opt4 = Dom_html.CoerceTo.input input2
let i2 = Js.Opt.get opt4 (fun() -> failwith "erreur")


(*La fontion qui prend en paramètre un objet bouton, un objet input et un objet <p> : là ou le résultat s'affiche*)
let clicked i deg=
  let t1 = Sys.time() in
  let c = Js.to_string(i##.value) in (*On récupère la valeur de la balise input donc la valeur saisie par l'utilisateur et on la transforme en string Caml*)
  deg##.innerHTML := Js.string(string_of_float (float_of_string(c)*.1.8+.32.0)^"°F");
  alert(string_of_float(Sys.time() -. t1))(*On transforme la valeur string Caml en valeur float puis dans le champs innerHTML de la balise <p> on place la valeur en float modifiée et remise en Js String *)

(*De même pour le deuxième bouton*)
let clicked2 i deg=
  let c = Js.to_string(i##.value) in
  deg##.innerHTML := Js.string(string_of_float ((float_of_string(c)-.32.0)/.1.8)^"°C")

(*Dans le champs handler du bouton on met la fonction que l'on vient de créer qui nous permet donc de définir la fonction clicked comme une action qui se declenche*)

let converterC_handler =
  Dom_html.handler begin
  fun evt -> (
       clicked i d;
    Js._true)
  end

(*De même pour le deuxième bouton*)
let converterF_handler =
  Dom_html.handler begin
  fun evt -> (
       clicked2 i2 d2;
    Js._true)
  end


let ()=
btn##.onclick := converterC_handler(*On declenche l'action que l'on a definie en cliquant sur le bouton en mettant ce handler dans le champs 'onclick' du bouton*)

let ()= btn2##.onclick := converterF_handler (*De même pour le deuxième bouton*)
