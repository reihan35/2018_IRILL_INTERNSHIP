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

var a = [0.0];

var b = [0.0];

var c = [0.0];

function puis(x) {
  if (x !== 0.0) {
    return 2.0 * puis(x - 1.0);
  } else {
    return 1.0;
  }
}

function perim(n) {
  return n * 2.0 * 3.14;
}

var cons = new Promise((function (resolve, _) {
        return resolve((document.getElementById("count").innerHTML = puis(a[0]), /* () */0));
      }));

var voys = new Promise((function (resolve, _) {
        return resolve((document.getElementById("count2").innerHTML = perim(a[0]), /* () */0));
      }));

function clicked() {
  return new Promise((function (resolve, _) {
                  return resolve((a[0] = document.getElementById("textF").value, /* () */0));
                })).then((function () {
                return Promise.all(/* array */[
                            new Promise((function (resolve, _) {
                                    return resolve((document.getElementById("count").innerHTML = puis(a[0]), /* () */0));
                                  })),
                            new Promise((function (resolve, _) {
                                    return resolve((document.getElementById("count2").innerHTML = perim(a[0]), /* () */0));
                                  }))
                          ]);
              }));
}

exports.Event = Event;
exports.Element = Element;
exports.Document = Document;
exports.Window = Window;
exports.a = a;
exports.b = b;
exports.c = c;
exports.puis = puis;
exports.perim = perim;
exports.cons = cons;
exports.voys = voys;
exports.clicked = clicked;
/* isEnterKey Not a pure module */