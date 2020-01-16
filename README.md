# Template Hardware Project

## To begin a new project / board revision
`make new NAME="project-name" VER="version" DESIGNER="Your Name"`

### Note 
* `NAME` is the file name of project and is required, no spaces allowed
* `VER` is optional and defaults to `0.1`
* `DESIGNER` is optional and defaults to `Josh Johnson`

## To generate gerbers
`make gerb` 

### Note
* requires python3 and a small number of dependencies

## To generate BOM
`make bom`

### Note
* utilises custom BOM format found in `scripts/josh_bom.xsl`

## To panelise a board
`make panel`

### Note
* Requires `*.kicad_pcb` file to be located at `hardware/ver/panel`
* Utilises [kicad-util](https://gitlab.com/dren.dk/kicad-util), which requires java to be installed

## To generate gerbers for panel
`make panel-gerb` 

### Note
* Requires `output-*.kicad_pcb` file to be located at `hardware/ver/panel`


