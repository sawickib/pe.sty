
PREFIX=PE_LaTeX_Template

all: zip

display: test
	evince $(PREFIX)/sample.pdf

test: copy_template
	cd $(PREFIX); pdflatex sample.tex

copy_template:
	mkdir -p $(PREFIX)
	cp -rf sample_paper/* $(PREFIX)
	cp -f pe.sty $(PREFIX)
	cp -f README.md $(PREFIX)

clean_template:
	rm -f $(PREFIX)/*.aux	
	rm -f $(PREFIX)/*.blg
	rm -f $(PREFIX)/*.ps
	rm -f $(PREFIX)/*.log
	rm -f $(PREFIX)/*.dvi
	rm -f $(PREFIX)/*.bbl

zip: copy_template test clean_template 
	zip -r $(PREFIX)_`date +%Y%m%d`.zip $(PREFIX)

clean:
	rm -rf $(PREFIX)
	rm -f *~	
	rm -f sample_paper/*~

