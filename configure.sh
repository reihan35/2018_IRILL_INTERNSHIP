mkdir javaOcaml

cd javaOcaml

#Installation js_of_ocaml

opam switch 4.06.0 > /dev/null
eval `opam config env`
opam install js_of_ocaml js_of_ocaml-ppx js_of_ocaml-lwt

#Installation Obrowser

opam switch 3.0.1 > /dev/null
eval `opam config env`
git clone https://github.com/ocsigen/obrowser.git
cd obrowser 
make
cd ..

#Installation BuckleScript

opam switch 4.02.3+buckle-1 > /dev/null
eval `opam config env`
git clone https://github.com/creationix/nvm.git
cd nvm
npm install --save bs-platform


