DOCS=index giotsas hartmann smith parker hoffmann maennel
DATA=jemdoc.css keith.briggs_at_bt_dot_com.png flyer.pdf flyer_ready.pdf hartmann.pdf hoffmann.ppt smith.ppt parker.pdf giotsas.pdf maennel.pdf
PHDOCS=$(addsuffix .html, $(DOCS))
TAGDOCS=$(addsuffix .taghtml, $(DOCS))
TAGDATA=$(addsuffix .tagdat, $(DATA))
EQDIR=eqs
EQS=$(wildcard $(EQDIR)/*.png)
TAGEQS=$(addsuffix .tageq, $(EQS))
DEST=richard@swelter:monmeetings/meeting10/
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
