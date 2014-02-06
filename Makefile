
all: zip

display: test
	evince PE_Latex_Template/sample.pdf

test: copy_template
	cd PE_Latex_Template; pdflatex sample.tex

copy_template:
	mkdir -p PE_Latex_Template
	cp -rf sample_paper/* PE_Latex_Template
	cp -f pe.sty PE_Latex_Template
	cp -f README.md PE_Latex_Template

clean_template:
	rm -f PE_Latex_Template/*.aux	
	rm -f PE_Latex_Template/*.blg
	rm -f PE_Latex_Template/*.ps
	rm -f PE_Latex_Template/*.log
	rm -f PE_Latex_Template/*.dvi
	rm -f PE_Latex_Template/*.bbl

zip: copy_template test clean_template
	zip -r PE_Latex_Template`date +%Y%m%d`.zip PE_Latex_Template

clean:
	rm -rf PE_Latex_Template
	rm *~

