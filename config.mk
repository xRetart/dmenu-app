VERSION = 5.0-rx

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2

# includes and libs
INCS = -I$(X11INC) -I$(FREETYPEINC)
LIBS = -L$(X11LIB) $(FREETYPELIBS) -lX11

# flags
CFLAGS  = $(INCS) -std=c99 -Wall -Wextra -Wpedantic -O2 -march=native -pipe -DVERSION=\"$(VERSION)\" -D_DEFAULT_SOURCE
LDFLAGS = $(LIBS)
