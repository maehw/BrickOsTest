### ==========================================================================
###  $Id: Makefile,v 1.7 2002/10/17 05:05:40 stephmo Exp $
###  FILE: demo/Makefile - make the C Language Demo Programs
###  brickOS - the independent LEGO Mindstorms OS
### --------------------------------------------------------------------------

# name for the brickOS kernel
LIBDIR = /usr/lib/brickos
KERNEL = $(LIBDIR)/brickOS

PROGRAMS=helloworld.lx linetrack.lx robots.lx rover.lx sound.lx

# extra dynamic sources
DOBJECTS=

all:: $(PROGRAMS) 

include $(LIBDIR)/Makefile.common
include $(LIBDIR)/Makefile.user

.depend: *.c
	$(MAKEDEPEND) *.c > .depend

depend:: .depend

install uninstall:
	@# nothing to do here but do it silently

#  NOTE: --format=1 is not supported on Linux ([ce]tags in emacs2[01] packages)
#   please set in your own environment
tag:
	-ctags *.c $(INCDIR)/*.h $(INCDIR)/*/*.h 
	-etags *.c $(INCDIR)/*.h $(INCDIR)/*/*.h 

clean::
	rm -f *.o *.dis *.dis2 *~ *.bak *.tgz *.s *.ds1 *.ds2 *.dmap *.dcoff 
	rm -f *.srec *.map *.coff .depend *.lx

realclean:: clean
	rm -f *.lx .depend tags TAGS

.PHONY: all depend tag clean realclean

# dependencies
#
ifndef NODEPS
include .depend
endif

### --------------------------------------------------------------------------
###                          End of FILE: demo/Makefile
### ==========================================================================
