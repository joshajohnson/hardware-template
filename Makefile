VER?=0.1
NAME?=

new:
	git submodule update --init --recursive --progress
	cd josh-kicad-lib && git checkout master && git pull
	cd josh-kicad-lib && bash setup.sh "$(VER)" "$(NAME)" "Josh Johnson"

gerb:
	python3 scripts/plot_gerbers.py hardware/$(VER)/*.kicad_pcb

panel:
	python3 scripts/panel.py hardware/$(VER)/panel/*.kicad_pcb

panel-gerb:
	python3 scripts/plot_gerbers.py hardware/$(VER)/panel/output.*
