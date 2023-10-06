PREFIX = /usr/local
LIBDIR = $(PREFIX)/lib/tcl

default:
	@echo meaningful targets: install
	@echo influential variables:
	@echo '   PREFIX:' $(PREFIX)
	@echo '   LIBDIR:' $(LIBDIR)

install:
	mkdir -p $(LIBDIR)/oyster
	cp *.tcl $(LIBDIR)/oyster/
