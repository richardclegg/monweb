DOCS=index lima greetham ma brughmans elliott gilmour saad pasteris
DATA=jemdoc.css keith.briggs_at_bt_dot_com.png elliot.pdf greetham.pdf pasteris.pdf ma.pdf gilmour.pdf saad.pptx brughmans.pdf lima.pdf
PHDOCS=$(addsuffix .html, $(DOCS))
TAGDOCS=$(addsuffix .taghtml, $(DOCS))
TAGDATA=$(addsuffix .tagdat, $(DATA))
EQDIR=eqs
EQS=$(wildcard $(EQDIR)/*.png)
TAGEQS=$(addsuffix .tageq, $(EQS))
DEST=richard@swelter:monmeetings/meeting12
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
