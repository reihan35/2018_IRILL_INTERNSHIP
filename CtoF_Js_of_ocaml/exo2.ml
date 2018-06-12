let win = Dom_html.window (*initalisation de l'objet window*)

(*On initalise l'objet boutton en recuperant avec le DOM HTML l'objet qui a pour id clickme puis on le coerce en valuer Js_of_caml*)
let btn = Dom_html.getElementById "clickme"
let opt = Dom_html.CoerceTo.button btn
let b = Js.Opt.get opt (fun() -> failwith "erreur")

(*On l'objet boutton avec DOM HTML puis on le coerce en valuer Js_of_caml*)
let d = Dom_html.getElementById "count"


(*On initalise l'objet input (là ou l'utilisateur saissie sa valeure) en recuperant avec le DOM HTML l'objet qui a pour id textF puis on le coerce en valuer Js_of_caml*)
let input = Dom_html.getElementById "textF"
let opt2 = Dom_html.CoerceTo.input input
let i = Js.Opt.get opt2 (fun() -> failwith "erreur")

(*On fait de meme pour le dexiem bouton*)
let btn2 = Dom_html.getElementById "clickme2"
let opt3 = Dom_html.CoerceTo.button btn2
let b2 = Js.Opt.get opt3 (fun() -> failwith "erreur")

let d2 = Dom_html.getElementById "count2"

let input2 = Dom_html.getElementById "textF2"
let opt4 = Dom_html.CoerceTo.input input2
let i2 = Js.Opt.get opt4 (fun() -> failwith "erreur")


(*La fontion qui prend en parametre un objet bouton un objet input et un objet <p> : là ou le resultat s'affiche*)
let clicked i b deg=
  let c = Js.to_string(i##.value) in (*On recupere la valeur de la balise input donc la valeur saissie par l'utilisateur et on le transforme en string Caml*)
  deg##.innerHTML := Js.string(string_of_float (float_of_string(c)*.1.8+.32.0)^"°F") (*On transforme la valeur string Caml en valeur float puis dans le champs inner html de la balise <p> on met la valeur en float modifié et remise en Js String *)

(*De meme pour le deuxiem bouton*)
let clicked2 i b deg=
  let c = Js.to_string(i##.value) in
  deg##.innerHTML := Js.string(string_of_float ((float_of_string(c)-.32.0)/.1.8)^"°C")

(*Dans le champs handler du bouton on met la fonction que l'on vient de creer qui nous permet donc de definir la fonction clicked comme une action qui se declanche*)
let converterC_handler =
  Dom_html.handler begin
  fun evt -> (
       clicked i b d;
    Js._true)
  end

(*De meme pour le deuxiem bouton*)
let converterF_handler =
  Dom_html.handler begin
  fun evt -> (
       clicked2 i2 b2 d2;
    Js._true)
  end


let ()= btn##.onclick := converterC_handler (*On declache l'action que l'on a defini en clickant sur le bouton en mettant ce handler dasn le champs onclick du bouton*)
let ()= btn2##.onclick := converterF_handler (*De meme pour le deuxiem bouton*)
