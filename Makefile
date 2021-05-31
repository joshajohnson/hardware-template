VERSION?=0.1
NAME?=
DESIGNER?=Josh Johnson

prod-files:
	make gerb
	make pnp
	make bom

new:
	git submodule update --init --recursive --progress
	cd josh-kicad-lib && git checkout master && git pull
	cd josh-kicad-lib && bash setup.sh "$(VERSION)" "$(NAME)" "$(DESIGNER)"

gerb:
	python3 scripts/plot_gerbers.py hardware/$(VERSION)/*.kicad_pcb

bom:
	cd hardware/$(VERSION) && python3 ../../scripts/josh_bom.py *.xml bom/BOM.csv

pnp:
	cd hardware/$(VERSION) && python3 "$(HOME)/josh/.local/share/kicad/5.99/scripting/plugins/InteractiveHtmlBom/InteractiveHtmlBomgenerate_interactive_bom.py" *.kicad_pcb

init:
	rm -rf .git
	git init
	git submodule add git@github.com:joshajohnson/josh-kicad-lib.git
