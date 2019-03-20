CFLAGS=-fomit-frame-pointer -O2 -s -g -Wall -Wno-unused-result
timeoutd:	timeoutd.c Makefile
	#$(CC) $(CFLAGS) -o timeoutd timeoutd.c
	$(CC) $(CFLAGS) -o timeoutd.o -c timeoutd.c -DTIMEOUTDX11
	$(CC) $(CFLAGS) -o timeoutd -L/usr/X11R6/lib timeoutd.o -lXss -lXext -lX11

install:
	install -o root -g adm -m 2111 timeoutd /usr/sbin
	install -o root -g adm -m 2111 timeoutd.service /lib/systemd/system
	install -o man -g man -m 444 timeoutd.8 /usr/share/man/man8
	install -o man -g man -m 445 timeouts.5 /usr/share/man/man5

