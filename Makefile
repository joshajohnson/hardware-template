VER?=0.1
NAME?=
DESIGNER?=Josh Johnson

new:
	git submodule update --init --recursive --progress
	cd josh-kicad-lib && git checkout master && git pull
	cd josh-kicad-lib && bash setup.sh "$(VER)" "$(NAME)" "$(DESIGNER)"

gerb:
	python3 scripts/plot_gerbers.py hardware/$(VER)/*.kicad_pcb

bom:
	cd hardware/0.1 && xsltproc -o "bom/BOM.csv" "/home/josh/Documents/kicad/josh_bom.xsl" *.xml

panel:
	python3 scripts/panel.py hardware/$(VER)/panel/*.kicad_pcb
	pcbnew hardware/$(VER)/panel/output-*

panel-gerb:
	python3 scripts/plot_gerbers.py hardware/$(VER)/panel/output.*
