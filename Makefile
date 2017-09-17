# Top level Makefile for salomeToRoot System
# Copyright (c) 2012
#
# Author: Mario Arturo Nieto Butron, 19/11/2012

LEX=flex -o
BISON=bison -d
CC=gcc -o
INSTALL=/usr/bin/salomeToRoot
DELETE=unlink

salomeToRoot: scanner.c parser.tab.c functions.c filter.c 
	$(CC) salomeToRoot parser.tab.c functions.c filter.c -lfl
	@echo " "
	@echo "   ============================================================"
	@echo "   ===        salomeToroot BUILD SUCCESSFUL.                ==="
	@echo "   === Run 'make install' now with user root.               ==="
	@echo "   ============================================================"

scanner.c:scanner.l
	$(LEX) scanner.c scanner.l 

parser.tab.c parser.tab.h: parser.y
	$(BISON) parser.y


install: salomeToRoot
	install $< $(INSTALL)

.PHONY:clean 
clean:
	rm -f scanner.c parser.tab.h parser.tab.c salomeToRoot

.PHONY: uninstall
uninstall: 
	$(DELETE) $(INSTALL)






	




