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

var Form = /* module */[];

function clicked() {
  document.getElementById("count").innerHTML = document.getElementById("textF").value * 1.8 + 32.0;
  return /* () */0;
}

function clicked2() {
  document.getElementById("count2").innerHTML = (document.getElementById("textF2").value - 32.0) / 1.8;
  return /* () */0;
}

exports.Event = Event;
exports.Element = Element;
exports.Document = Document;
exports.Window = Window;
exports.Form = Form;
exports.clicked = clicked;
exports.clicked2 = clicked2;
/* isEnterKey Not a pure module */
