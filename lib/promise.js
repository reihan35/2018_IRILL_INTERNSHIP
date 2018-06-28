function sleepFor( sleepDuration ){
    var now = new Date().getTime();
    while(new Date().getTime() < now + sleepDuration){ /* do nothing */ } 
}
  
new Promise((function (resolve, _) {
          return resolve((a[0] = document.getElementById("textF").value, /* () */0));
        })).then((function () {
        return Promise.all(/* array */[
                    new Promise((function (resolve, _) {
                            resolve((sleepFor(1000))(document.getElementById("count").innerHTML = a[0] + 2.0, /* () */0));
                          })),
                    new Promise((function (resolve, _) {
                            resolve((sleepFor(100))(document.getElementById("count2").innerHTML = perim(a[0]), /* () */0));
                          })),
                          document.getElementById("clickme").disabled = false
                  ]);
          }));
    }
