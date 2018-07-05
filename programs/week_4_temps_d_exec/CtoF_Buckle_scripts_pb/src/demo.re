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
  [@bs.set] external setValue : (elementT, string) => unit = "value";
  [@bs.get] external getValue : elementT => string = "value";
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


let clicked =() => { /*On définit les deux fonction qui seront applée au moment de click sur le bouton : */
  let x = Sys.time();
    Element.setInnerHTML2(Document.getElementById("count"),getvalue(Document.getElementById("textF"))*.1.8+.32.0);
    Window.alert2(Sys.time() -. x);
    /*On récupère la valeur innerHTML de l'input saissi par l'utilisateur on la converti en °F puis on met la valeur converie à l'intérieur de la balise p */
}
    /*On continue de la même facon pour le deuxième bouton  */
let clicked2() =
    Element.setInnerHTML2(Document.getElementById("count2"),((getvalue(Document.getElementById("textF2"))-.32.0)/.1.8));