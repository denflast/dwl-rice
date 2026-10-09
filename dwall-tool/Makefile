in=dwall.sh
out=dwall

prefix=/usr/local/

all: dwall

dwall: $(in)
	cp $(in) dwall

install: all	
	cp $(out) $(prefix)/bin
	@echo "Installed in $(prefix)/bin"
