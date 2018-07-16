# 2018_IRILL_INTERNSHIP

interopérabilité Ocaml javaScript : une étude comparative

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Ocaml and JavaScript Interoperability : a comparative study

# Description

Presque tout ce dont vous avez besoin pour faire de l'interopérabilité Ocaml-JavaScript !
Comme vous le savez il existe trois méthodes différentes pour ce dernier :

Js_of_ocaml, Obrowser et Buckle Script.


Ce dépôt git vous aidera à commencer n'importe laquelle ainsi que vous donner une comparaison des trois pour vous guider à choisir celle qui vous convient le mieux.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 

Almost all you need to start running OCaml programs in JavaScript environment!
As you may know there are three different methods for this:

js_of_ocaml, Obrowser and BuckleScript.


This git repository will help you start out any of these methods as well as giving you a comparison between them to help you choose the one that suits you best.

# Installation / Install

Attention !! Opam 1.2 devrait être installé.

Attention !! Opam 1.2 is required.

```
$ git clone https://github.com/reihan35/2018_IRILL_INTERNSHIP.git

$ cd 2018_IRILL_INTERNSHIP

$ ./configure.sh

```

# Documentation

Js_of_ocaml : 

http://ocsigen.org/js_of_ocaml/

Obrowser : 

lib > obrowser-master > manual

BuckleScript : 

https://reasonml.github.io/docs/en/interop.html

# Exemples / Examples 

Js_of_ocaml :

lib > js_of_ocaml > examples


Obrowser : 

lib > obrowser-master > examples


BuckleScript :

Pas d'exemples BuckleScript fournis avec le dépôt original. 

No examples in the original repository.

Exemples de comparaisons / Examples to compare : 

Dans le répertoire "programs" vous pouvez trouver des exemples qui résolvent le même problème avec les trois méthodes et vous pouvez les comparer.

In the "programs" folder you can find examples that solve the same problem with three different methods and you can compare them.

# Tutorats-Comparaison / Tutorials-Comparaison

Dans le répertoire "reports" vous pouvez trouver un bref tutorat sur le fonctionnement des trois méthodes ainsi que des explications sur les points forts et faibles de chaque méthode. Vous pouvez également trouver des graphes qui comparent la vitesse de compilation/ exécution de chaque méthode.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

In the "reports" folder you can find a brief tutorial on these three methods and how they work , as well as their upsides and downsides.You can also find graphs that compare their compile/running speeds.


# Fichiers sources / Source files 

Les fichiers sources se trouvent dans le répertoire "lib", vous pouvez donc avoir accès aux libraires.Lorsque vous cherchez une fonction je vous propose de faire une recherche dans ce répertoire.

Par exemple :

On essaye de trouver la fonction "time()" en Js_of_ocaml; il suffit de passer la commande suivante :

```
cd lib/js_of_ocaml/lib
$grep time *.ml
```
On aura :

```
dom_html.ml:  let timeupdate = Dom.Event.make "timeupdate"
dom_html.ml:class type timeRanges = object
dom_html.ml:  method buffered : timeRanges t readonly_prop
dom_html.ml:  method played : timeRanges t readonly_prop
dom_html.ml:  method seekable : timeRanges t readonly_prop
dom_html.ml:type timeout_id
dom_html.ml:  method setTimeout : (unit -> unit) Js.callback -> float -> timeout_id meth
dom_html.ml:  method clearTimeout : timeout_id -> unit meth
dom_html.ml:type timeout_id_safe = timeout_id option ref
dom_html.ml:let setTimeout callback d : timeout_id_safe =
dom_html.ml:let clearTimeout (id : timeout_id_safe) =
firebug.ml:  method time : js_string t -> unit meth
firebug.ml:  method timeEnd : js_string t -> unit meth
geolocation.ml:  method timestamp : Js.date Js.readonly_prop
geolocation.ml:  method timeout : int Js.writeonly_prop
intl.ml:    method timeZone : Js.js_string Js.t Js.readonly_prop
intl.ml:    method timeZoneName : Js.js_string Js.t Js.optdef_prop
intl.ml:    method timeZone : Js.js_string Js.t Js.optdef Js.prop
intl.ml:    method timeZoneName : Js.js_string Js.t Js.optdef Js.prop
intl.ml:      val mutable timeZone = Js.undefined
intl.ml:      val mutable timeZoneName = Js.undefined
xmlHttpRequest.ml:  method ontimeout : ('self t, 'self File.progressEvent t) Dom.event_listener writeonly_prop
xmlHttpRequest.ml:  let timeout = Dom.Event.make "timeout"
```
Et donc on pourra retrouver la fonction dont on a besoin tout en ayant des informations précieuses sur elle.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Source files are in the "lib" file, thus you can have access to the librarys.when you need to find a function I suggest you to search in this folder.

For example:
 
You are looking for the "time()" function in Js_of_ocaml; you can simply run the following command:


```
cd lib/js_of_ocaml/lib
$grep time *.ml
```

You'll have : 

```
dom_html.ml:  let timeupdate = Dom.Event.make "timeupdate"
dom_html.ml:class type timeRanges = object
dom_html.ml:  method buffered : timeRanges t readonly_prop
dom_html.ml:  method played : timeRanges t readonly_prop
dom_html.ml:  method seekable : timeRanges t readonly_prop
dom_html.ml:type timeout_id
dom_html.ml:  method setTimeout : (unit -> unit) Js.callback -> float -> timeout_id meth
dom_html.ml:  method clearTimeout : timeout_id -> unit meth
dom_html.ml:type timeout_id_safe = timeout_id option ref
dom_html.ml:let setTimeout callback d : timeout_id_safe =
dom_html.ml:let clearTimeout (id : timeout_id_safe) =
firebug.ml:  method time : js_string t -> unit meth
firebug.ml:  method timeEnd : js_string t -> unit meth
geolocation.ml:  method timestamp : Js.date Js.readonly_prop
geolocation.ml:  method timeout : int Js.writeonly_prop
intl.ml:    method timeZone : Js.js_string Js.t Js.readonly_prop
intl.ml:    method timeZoneName : Js.js_string Js.t Js.optdef_prop
intl.ml:    method timeZone : Js.js_string Js.t Js.optdef Js.prop
intl.ml:    method timeZoneName : Js.js_string Js.t Js.optdef Js.prop
intl.ml:      val mutable timeZone = Js.undefined
intl.ml:      val mutable timeZoneName = Js.undefined
xmlHttpRequest.ml:  method ontimeout : ('self t, 'self File.progressEvent t) Dom.event_listener writeonly_prop
xmlHttpRequest.ml:  let timeout = Dom.Event.make "timeout"
```

And so you can find the function and have helpful inforamtion on it.


# Enifn / Finally 
Amusez-vous bien et faites de beaux programmes et bien sûr je vous pris de me signaler si vous voyez n'importe quels soucis.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Have fun and make beautiful programs and please let me know if you find any issues.
