PREFIX = /usr/local
VERSION = `cat version.txt`

build:
	bundle install
	gem build um.gemspec

install: build completion docs
	gem install --ignore-dependencies --no-user-install --no-document \
		um-$(VERSION).gem

completion:
	sudo install -Dm644 um-completion.sh /etc/bash_completion.d

docs:
	sudo install -Dm644 doc/man1/* -t $(PREFIX)/share/man/man1
