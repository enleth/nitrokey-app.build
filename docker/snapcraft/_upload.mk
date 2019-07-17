#!/usr/bin/env -S make -f

.PHONY: info
info:
	@echo "Tool for managing snapcraft upload"
	snapcraft login --help


.PHONY: login
login:
	snapcraft login

.PHONY: upload
upload: login
	cd /build
	snapcraft login
	snapcraft upload nitrokey-app*1.4*snap

.PHONY: test
test: login
	snapcraft release nitrokey-app $(RELEASE) edge

.PHONY: release
release: login
	snapcraft release nitrokey-app $(RELEASE) beta,candidate,stable

.PHONY: localtest
localtest:
	sudo snap remove nitrokey-app
	sudo snap install nitrokey-app --edge --classic
	sudo snap refresh nitrokey-app --edge --classic
	snap list nitrokey-app
	snap run nitrokey-app --version
