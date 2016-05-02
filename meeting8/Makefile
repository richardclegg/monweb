DOCS=index walking shaikh mapp greetham zhou lambiotte kurlin
DATA=jemdoc.css keith.briggs_at_bt_dot_com.png flyer.pdf flyer2.pdf greetham.pdf mapp.ppt zhou.pdf zhou.ppt kurlin.pdf lambiotte.pdf shaikh.ppt
PHDOCS=$(addsuffix .html, $(DOCS))
TAGDOCS=$(addsuffix .taghtml, $(DOCS))
TAGDATA=$(addsuffix .tagdat, $(DATA))
EQS=eqs/*.png
DEST=richard@swelter:monmeetings/meeting8
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
	jemdoc.py -o $@ $<

%.taghtml: %.html
	touch $@
	scp $< $(DEST)

%.tagdat: %
	touch $@
	scp $< $(DEST)
eqtag: $(EQS)
	touch $@
	scp $(EQS) $(EQDEST)
.PHONY : clean
clean :
	-rm -f *.html
	-rm -f *.taghtml
	-rm -f *.tagdat
	-rm -f *~
