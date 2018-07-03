/*[@bs.send] external toString : Js.t('a) => string = "toString";*/


/*On définit quelques modules pour pouvoir demander des fonctions externes de manière plus propre*/
module Event = {
  type eventT;
  let isEnterKey: eventT => bool = [%bs.raw
    {|
    function (e) {
      return e.which === 13;
    }
  |}
  ];
};

module Element = {
  type elementT;
  [@bs.set] external setInnerHTML : (elementT, string) => unit = "innerHTML"; /*On peut définir plusieurs définitions de la même fonction externe avec des typages différents */
  [@bs.set] external setInnerHTML2 : (elementT, float) => unit = "innerHTML";/*ici j'ai définit un setInnerHTML spécialement pour les floats pour l'affichage du degré converti en °C ou en °F*/
  [@bs.get] external getInnerHTML : elementT => string = "innerHTML";
  [@bs.get] external getInnerHTML2 : elementT => float = "innerHTML";
  [@bs.get] external getValue2 : elementT => float = "value";
  [@bs.get] external setValue2 : elementT => float = "value";
  [@bs.set] external setdisabled : (elementT,bool) => unit  = "disabled";
  [@bs.send]
  external addEventListener : (elementT, string, Event.eventT => unit) => unit =
    "addEventListener";
};

module Document = {
  [@bs.val]
  external getElementById : string => Element.elementT =
    "document.getElementById";
  [@bs.val]
  external addEventListener : (string, Event.eventT => unit) => unit =
    "document.addEventListener";
};

module Window = {
  type intervalIdT;
  [@bs.val]
  external setInterval : (unit => unit, int) => intervalIdT =
    "window.setInterval";
  [@bs.val]
  external clearInterval : intervalIdT => unit = "window.clearInterval";
  [@bs.val] external alert : string => unit = "alert";
  [@bs.val] external alert2 : float => unit = "alert";
};

/*module Form = {
  type it;
  [@bs.get] external getfirstname : Element.elementT => it = "firstname";
  [@bs.get] external getlastname :  Element.elementT => it = "lastname";
  [@bs.get] external getvalue : it => string = "value";
}*/

[@bs.get] external getvalue : Element.elementT => float = "value";

let perim = n =>
  n*.2.0*.3.14;

let puis = x =>
  x+.2.0;


let nbr_cons2 = (n, deg) => {
  let r = ref(1);
  while (r^ < 10000000) {
    print_int(r^);
    print_string(" ");
    r := r^ + 1;
  };
  Lwt.return(Element.setInnerHTML2(deg,perim(n)));
};

let nbr_voys2 = (n, deg) => {
  let r = ref(1);
  while (r^ < 1000000) {
    print_int(r^);
    print_string(" ");
    r := r^ + 1;
  };
  Lwt.return(Element.setInnerHTML2(deg,perim(n)));
};

Lwt.return(Window.alert("hello"));

let clicked() = 
Element.setdisabled(Document.getElementById("clickme"),true);
Lwt.bind(Lwt.return(Element.getValue2(Document.getElementById("clickme"))), s =>
Lwt.bind(
  Lwt.join([
    (nbr_voys2(s, Document.getElementById("count"))),
    (nbr_cons2(s, Document.getElementById("count2"))),
  ]),
  () =>
  Lwt.return(Element.setdisabled(Document.getElementById("clickme"),false)),
  ),
);

/*let clicked() = 
    Element.setdisabled(Document.getElementById("clickme"),true);
    Lwt_main.run (Lwt.bind (Lwt.return ((Element.getvalue2(Document.getElementById("clickme")))) (fun s -> Lwt.bind (Lwt.join [((nbr_voys2 s deg)) ; (nbr_cons2 s deg2)]) (fun() -> (button_enable_t b)))))*/
