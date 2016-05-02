SUBDIRS=meeting8 meeting9 meeting10 meeting11 meeting12 meeting13 meeting14
DOCS=index
DATA=jemdoc.css keith.briggs_at_bt_dot_com.png
PHDOCS=$(addsuffix .html, $(DOCS))
TAGDOCS=$(addsuffix .taghtml, $(DOCS))
TAGDATA=$(addsuffix .tagdat, $(DATA))
EQS=eqs/*.png
DEST=richard@richardclegg.org:monmeetings/
EQDEST=$(DEST)/eqs

all :	docs
	@for i in $(SUBDIRS); do \
	echo "Make in $$i..."; \
	(cd $$i; $(MAKE) ); done
	@echo "Done! Don't forget to make install "

.PHONY : docs 
docs : $(PHDOCS)

.PHONY : update
install : $(TAGDOCS) $(TAGDATA) $(TAGEQS)
	@for i in $(SUBDIRS); do \
	echo "Installing in $$i..."; \
	(cd $$i; $(MAKE) install); done
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
eqtag: $(EQS)
	touch $@
	scp $(EQS) $(EQDEST)
.PHONY : clean
clean :
	-rm -f *.html
	-rm -f *.taghtml
	-rm -f *.tagdat
	-rm -f *~

