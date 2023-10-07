PREFIX = /usr/local
LIBDIR = $(PREFIX)/lib/tcl
TCLSH = tclsh

default:
	@echo meaningful targets: install test
	@echo influential variables:
	@echo '   PREFIX:' $(PREFIX)
	@echo '   LIBDIR:' $(LIBDIR)

install:
	mkdir -p $(LIBDIR)/oyster
	cp oyster.tcl pkgIndex.tcl $(LIBDIR)/oyster/

test:
	$(TCLSH) ./demottk.tcl oyster
