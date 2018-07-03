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
  [@bs.get] external getValue2 : elementT => float = "value";
  [@bs.get] external setValue2 : elementT => float = "value";
  [@bs.set] external setdisabled : (elementT,bool) => unit  = "disabled";
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
  [@bs.val] external alert3 : int => unit = "alert";
};

/*module Form = {
  type it;
  [@bs.get] external getfirstname : Element.elementT => it = "firstname";
  [@bs.get] external getlastname :  Element.elementT => it = "lastname";
  [@bs.get] external getvalue : it => string = "value";
}*/

[@bs.get] external getvalue : Element.elementT => string = "value";

/*module Promise = Js_promise


let rec nbr_voys = (str, i, n) =>
  switch (str, i, n) {
  | ("", i, n) => (-1)
  | (str, i, n) when i == n => 0
  | (str, i, n)
      when
        str.[i] == 'a'
        || str.[i] == 'e'
        || str.[i] == 'i'
        || str.[i] == 'o'
        || str.[i] == 'y'
        || str.[i] == 'u'
        || str.[i] == 'A'
        || str.[i] == 'E'
        || str.[i] == 'I'
        || str.[i] == 'O'
        || str.[i] == 'Y'
        || str.[i] == 'U' =>
    1 + nbr_voys(str, i + 1, n)
  | (str, i, n) => nbr_voys(str, i + 1, n)
  };

let rec nbr_space = (str, i, n) =>
  switch (str, i, n) {
  | ("", i, n) => (-1)
  | (str, i, n) when i == n => 0
  | (str, i, n)
      when
        str.[i] == ' '
        || str.[i] == '*'
        || str.[i] == '-'
        || str.[i] == '+'
        || str.[i] == '/'
        || str.[i] == '_' =>
    1 + nbr_space(str, i + 1, n)
  | (str, i, n) => nbr_space(str, i + 1, n)
  };

let nbr_cons = str =>
  String.length(str)
  - nbr_voys(str, 0, String.length(str))
  - nbr_space(str, 0, String.length(str));

let a = Array.make(2, 0);
let b = Array.make(1, "");

let cons = Js.Promise.(
  resolve(a[0]=nbr_cons(b[0]))
);

let voys = Js.Promise.(
  resolve(a[1]=nbr_voys(b[0],0,String.length(b[0])))
);

Js.Promise.(
      resolve(b[0]=getvalue(Document.getElementById("textF")))
      |> then_(() =>Js.Promise.all([|cons,voys|])
    ));*/

Lwt.return(Document.alert("hello"));


    let a = ref(0.0);

    let b = ref(0.0);
    
    let c = ref(0.0);    

let puis = x =>
    x+.2.0;


Element.setdisabled(Document.getElementById("clickme"),false);


/*let clicked = () => {
  Lwt.return(Document.alert("Hello"));  
  /*Lwt_main.run(
      Lwt.bind(Lwt.return(Element.getvalue2(Document.getElementById("clickme")), s =>
        Lwt.bind(Lwt.join([nbr_voys2(s, Document.getElementById("conut")), nbr_cons2(s, Document.getElementById("conut"))]))
      ),
    );
  }; */

/*let perim = n =>
  n*.2.0*.3.14

  let nbr_cons2 = (n, deg) => {
    let r = ref(1);
    while (r^ < 10000000) {
      print_int(r^);
      print_string(" ");
      r := r^ + 1;
    };
    Lwt.return(deg,perim(n));
  };
  
  /*Thread qui change la valeur de la proprieté innerHTML de l'element deg avec le nombre de voyelles de la string passée en parametre*/
  
  let nbr_voys2 = (n, deg) => {
    let r = ref(1);
    while (r^ < 1000000) {
      print_int(r^);
      print_string(" ");
      r := r^ + 1;
    };
    Lwt.return(
      Lwt.return(deg,puis(n)));
    );
  };
  
  let button_enable_t = b => Lwt.return(button_enable(b));
  

/*let clicked() =
  Element.setdisabled(Document.getElementById("clickme"),true);
  button_disable b;
  Lwt_main.run (Lwt.bind (Lwt.return ((Element.getvalue2(Document.getElementById("clickme")))) (fun s -> Lwt.bind (Lwt.join [((nbr_voys2 s deg)) ; (nbr_cons2 s deg2)]) (fun() -> (button_enable_t b))))
 */   

  
    /*Element.setInnerHTML2(Document.getElementById("count"),getvalue(Document.getElementById("textF"))*.1.8+.32.0);

    let clicked2() =
    Element.setInnerHTML2(Document.getElementById("count2"),((getvalue(Document.getElementById("textF2"))-.32.0)/.1.8)); */