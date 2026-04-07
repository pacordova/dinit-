sysconfdir = /etc
libdir = /usr/lib64

# libdir by default
DESTDIR = $(libdir)
RSYNC = rsync -b -c --ignore-non-existing

copy:
	$(RSYNC) $(libdir)/dinit.d/*     meta/
	$(RSYNC) $(libdir)/dinit.d/*     target/
	$(RSYNC) $(libdir)/dinit.d/*     services/
	$(RSYNC) $(sysconfdir)/dinit.d/* services/
	$(RSYNC) $(sysconfdir)/*         etc/

clean:
	find . -name \*~ -delete
