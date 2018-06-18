# Caml Virtual Machine in JavaScript       
# (C) 2007 Benjamin Canou (Benjamin.Canou@gmail.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
EXAMPLES = $(patsubst examples/%,%, $(wildcard examples/*))
EXAMPLES_TARGETS = $(patsubst examples/%,%.example, $(wildcard examples/*))
OCAMLFIND = ocamlfind
.PHONY: tuto dist plugin lwt

all: .check_version rt/caml/stdlib.cma vm.js tuto $(EXAMPLES_TARGETS) examples.html AXO lwt

.check_version:
	@[ "$(shell ocamlc -vnum)" = "3.12.0" ] || \
	  [ "$(shell ocamlc -vnum)" = "3.12.1" ] || \
	  ( echo "You need ocaml version 3.12.0 or 3.12.1"; \
            exit 1 )
	touch $@

%.example: 
	@echo "[EXAMPLE] $*"
	@cd examples/$* && $(MAKE) --no-print-directory

AXO:
	@echo "[AXO]"
	@cd axo/ && $(MAKE) --no-print-directory

lwt:
	@echo "[LWT]"
	@cd lwt/ && $(MAKE) --no-print-directory

tuto:
	@echo "[TUTORIAL]"
	@cd tutorial && $(MAKE) --no-print-directory

plugin:
	@echo "[MOZILLA PLUGIN]"
	@cd rt/plugin/npapi && $(MAKE) --no-print-directory

examples.html:
	@echo "[EXAMPLES INDEX]"
	@echo "<body><html><ul>" > $@ ; \
	 for i in $(EXAMPLES) ; do echo "<li><a href='examples/$$i/index.html'>$$i</a></li>" >> $@ ; done ; \
	echo "</ul></body></html>" >> $@

rt/caml/stdlib.cma: $(wildcard rt/caml/*.ml) $(wildcard rt/caml/*.mli)
	cd rt/caml && $(MAKE)

vm.js: 	$(wildcard rt/js/*.js)	
	@echo "[CPP] $@"
	@cpp -DDEBUG -P -Irt/js rt/js/main.js vm.js
	@cat rt/js/ffi.js >> vm.js

clean:
	@echo "[CLEAN]"
	@$(RM) -f rt/js/*~
	@cd rt/caml && $(MAKE) clean
	@rm -f examples.html
	@cd tutorial && $(MAKE) clean
	@cd lwt && $(MAKE) clean
	@$(RM) -f *.exe *.cm* *.so *.a *.dylib *.o *~ *.uue \
                    vm.js server
	@$(RM) -f examples/*/*.exe examples/*/*.cm* examples/*/*.exe.uue
	@for ex in $(EXAMPLES) ; do cd examples/$$ex && $(MAKE) clean && cd ../.. ; done
	@cd axo && $(MAKE) clean


VERSION := $(shell head -n 1 VERSION)

dist: clean
	darcs dist -d obrowser-$(VERSION)

install:
	$(OCAMLFIND) install -patch-version ${VERSION} obrowser META vm.js rt/js/ffi.js rt/caml/stdlib.cma rt/caml/*.cmi rt/caml/std_exit.cmo axo/AXO.cma axo/AXO*.cmi lwt/lwt_obrowser.cma lwt/lwt_*.cmi
	install -m 644 rt/caml/dllstdlib.so `$(OCAMLFIND) -printconf destdir`/obrowser

uninstall:
	$(OCAMLFIND) remove obrowser
