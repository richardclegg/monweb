DOCS=index battiston papavassiliou bonaventura ciotti panzarasa zanin 
DATA=jemdoc.css keith.briggs_at_bt_dot_com.png bonaventura.pdf battiston.pdf schaub.pdf clough.pdf zanin.pdf schaub_slides.pdf panzarasa.pdf clough_slides.pdf papavassiliou.pdf
PHDOCS=$(addsuffix .html, $(DOCS))
TAGDOCS=$(addsuffix .taghtml, $(DOCS))
TAGDATA=$(addsuffix .tagdat, $(DATA))
EQDIR=eqs
EQS=$(wildcard $(EQDIR)/*.png)
TAGEQS=$(addsuffix .tageq, $(EQS))
DEST=richard@swelter:monmeetings/meeting13
EQDEST=$(DEST)/eqs

all : docs
	@echo "Done! Don't forget to make install "

.PHONY : docs 
docs : $(PHDOCS)

.PHONY : update
install : $(TAGDOCS) $(TAGDATA) $(TAGEQS)
# insert code for copying to server here.
	@echo ' All copied.'

%.html : %.jemdoc jemdoc.css
	./jemdoc.py -o $@ $<

%.taghtml: %.html
	touch $@
	scp $< $(DEST)

%.tagdat: %
	touch $@
	scp $< $(DEST)
	
%.tageq: %
	touch $@		
	scp $< $(EQDEST)

.PHONY : clean
clean :
	-rm -f *.html
	-rm -f *.taghtml
	-rm -f *.tagdat
	-rm -f *~
