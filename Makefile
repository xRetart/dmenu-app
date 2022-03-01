include config.mk

SRC_DIR = src
OBJ_DIR = bin
SRC = $(SRC_DIR)/dmenu.c $(SRC_DIR)/drw.c $(SRC_DIR)/util.c
OBJ = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRC))
HEADERS = $(SRC_DIR)/arg.h $(SRC_DIR)/config.h $(SRC_DIR)/drw.h

dmenu: $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS)

$(OBJ): $(HEADERS) config.mk
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir --parents $(OBJ_DIR)
	$(CC) -c -o $@ $(CFLAGS) $<

clean:
	$(RM) -r dmenu $(OBJ_DIR) dmenu-$(VERSION).tar.gz

dist: clean
	tar --create --auto-compress --file=dmenu-$(VERSION).tar.zst *

install: dmenu dmenu-app
	mkdir --parents $(DESTDIR)$(PREFIX)/bin $(DESTDIR)$(MANPREFIX)/man1
	install --mode=755 dmenu $(DESTDIR)$(PREFIX)/bin/dmenu
	sed "s/VERSION/$(VERSION)/g" < dmenu.1 > $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
	install --mode=755 dmenu-app $(DESTDIR)$(PREFIX)/bin/dmenu-app

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/dmenu $(DESTDIR)$(PREFIX)/bin/dmenu-app $(DESTDIR)$(MANPREFIX)/man1/dmenu.1
