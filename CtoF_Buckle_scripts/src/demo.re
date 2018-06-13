[@bs.send] external toString : Js.t('a) => string = "toString";

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
  [@bs.set] external setInnerHTML : (elementT, string) => unit = "innerHTML";
  [@bs.set] external setInnerHTML2 : (elementT, float) => unit = "innerHTML";
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

module Form = {
  type it;
  [@bs.get] external getfirstname : Element.elementT => it = "firstname";
  [@bs.get] external getlastname :  Element.elementT => it = "lastname";
  [@bs.get] external getvalue : it => string = "value";
}

[@bs.get] external getvalue : Element.elementT => float = "value";


let x = string_of_float(88.5);

let clicked(a) =
    Element.setInnerHTML2(Document.getElementById("count"),getvalue(Document.getElementById("textF"))*.1.8+.32.0);

let clicked2(a) =
    Element.setInnerHTML2(Document.getElementById("count2"),((getvalue(Document.getElementById("textF2"))-.32.0)/.1.8));

