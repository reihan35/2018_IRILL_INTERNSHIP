// Generated by BUCKLESCRIPT VERSION 3.1.5, PLEASE EDIT WITH CARE
'use strict';


var isEnterKey = (
    function (e) {
      return e.which === 13;
    }
  );

var Event = /* module */[/* isEnterKey */isEnterKey];

var Element = /* module */[];

var Document = /* module */[];

var Window = /* module */[];

function clicked(a) {
  if (a.innerHTML === "clicked !") {
    a.innerHTML = "click me !";
    return /* () */0;
  } else {
    a.innerHTML = "clicked !";
    return /* () */0;
  }
}

exports.Event = Event;
exports.Element = Element;
exports.Document = Document;
exports.Window = Window;
exports.clicked = clicked;
/* isEnterKey Not a pure module */
