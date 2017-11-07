DESTDIR ?= /

help:
	@echo 'Usage:'
	@echo 'make install'
	@echo 'make uninstall'

install:
	@mkdir -p ${DESTDIR}/usr/sbin/
	@chmod 755 ${DESTDIR}/usr/sbin/ smartmon
	@chown root:root ${DESTDIR}/usr/sbin/ smartmon
#	@chmod 755 smartmon
	@cp -v smartmon ${DESTDIR}/usr/sbin/

	@mkdir -p ${DESTDIR}/etc/smartmon/onerror.d
	@chown root:root smartmon.conf.default
	@chmod 644 smartmon.conf.default
	@cp -v smartmon.conf.default ${DESTDIR}/etc/smartmon/

	@mkdir -p ${DESTDIR}/usr/doc/smartmon/
	@chown root:root LICENSE.md README.md
	@chmod 644 LICENSE.md README.md
	@cp -v LICENSE.md README.md ${DESTDIR}/usr/doc/smartmon/

uninstall:
	@rm -rfv ${DESTDIR}/usr/sbin/smartmon
	@rm -rfv ${DESTDIR}/usr/doc/smartmon/
	@rm -riv ${DESTDIR}/etc/smartmon/
	@rm -riv ${DESTDIR}/var/cache/smartmon/
