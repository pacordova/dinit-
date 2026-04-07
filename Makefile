# install to libdir by default
sysconfdir = /etc
libdir = /usr/lib64

RSYNC = rsync -b -c --ignore-non-existing

install:
	mkdir -p $(sysconfdir)/dinit.d/boot.d
	mkdir -p $(libdir)/dinit.d 
	cp -f meta/* $(libdir)/dinit.d
	cp -f targets/* $(libdir)/dinit.d
	cp -f services/* $(libdir)/dinit.d
	cp -f etc/rc.local $(sysconfdir)/rc.local

copy:
	$(RSYNC) $(libdir)/dinit.d/*     meta/
	$(RSYNC) $(libdir)/dinit.d/*     targets/
	$(RSYNC) $(libdir)/dinit.d/*     services/
	$(RSYNC) $(sysconfdir)/dinit.d/* services/
	$(RSYNC) $(sysconfdir)/rc.local  etc/

clean:
	find . -name \*~ -delete
