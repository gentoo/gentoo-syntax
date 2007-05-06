# Makefile for gentoo-syntax

distapp = gentoo-syntax
distver := $(shell date --iso | sed -e 's~-~~g')
distpkg := $(distapp)-$(distver)

PREFIX = ${HOME}/.vim/

files_vars = \
	files_doc \
	files_ftdetect \
	files_ftplugin \
	files_indent \
	files_plugin \
	files_syntax

files_doc = \
	doc/gentoo-syntax.txt

files_ftdetect = \
	ftdetect/gentoo.vim \
	ftplugin/ebuild.vim \
	ftdetect/eselect.vim

files_ftplugin = \
	ftplugin/gentoo-changelog.vim \
	ftplugin/gentoo-metadata.vim \
	ftplugin/eselect.vim

files_indent = \
	indent/ebuild.vim \
	indent/gentoo-metadata.vim \
	indent/eselect.vim

files_plugin = \
	plugin/bugsummary.vim \
	plugin/gentoo-common.vim \
	plugin/newebuild.vim \
	plugin/newmetadata.vim \
	plugin/newinitd.vim \
	plugin/neweselect.vim

files_syntax = \
	syntax/ebuild.vim \
	syntax/gentoo-changelog.vim \
	syntax/gentoo-common.vim \
	syntax/gentoo-conf-d.vim \
	syntax/gentoo-env-d.vim \
	syntax/gentoo-init-d.vim \
	syntax/gentoo-make-conf.vim \
	syntax/gentoo-metadata.vim \
	syntax/gentoo-mirrors.vim \
	syntax/gentoo-package-keywords.vim \
	syntax/gentoo-package-mask.vim \
	syntax/gentoo-package-use.vim \
	syntax/gentoo-use-desc.vim \
	syntax/glep.vim \
	syntax/guidexml.vim \
	syntax/eselect.vim

files = $(foreach f, $(files_vars), $($(f)) )

scripts: ${files}

install: install-dirs install-files

install-dirs: $(foreach a, $(sort $(dir $(files))), \
	install-dir-$(a))

install-files: $(foreach a, $(sort $(files)), \
	install-file-$(subst /,_,$(a) ))

install-dir-%:
	mkdir -p "$(PREFIX)/$*"

install-file-%: $(subst _,/,$*)
	cp "$(subst _,/,$*)" "$(PREFIX)/$(subst _,/,$*)"

uninstall : uninstall-files

uninstall-files: $(foreach a, $(sort $(files)), \
	uninstall-file-$(subst /,_,$(a) ))

uninstall-file-%: $(subst _,/,$*)
	[ ! -f "$(PREFIX)/$(subst _,/,$*)" ] || rm "$(PREFIX)/$(subst _,/,$*)"

dist:
	mkdir "$(distpkg)"
	$(MAKE) PREFIX="$(distpkg)" install
	cp README "$(distpkg)/"
	tar jcf "$(distpkg).tar.bz2" "$(distpkg)"
	rm -fr "$(distpkg)/"

dist-sign: dist
	gpg --armour --detach-sign "$(distpkg).tar.bz2"
	mv "$(distpkg).tar.bz2.asc" "$(distpkg).tar.bz2.signature"

dist-upload: dist dist-sign
	echo -ne "user anonymous gentoo-syntax\ncd incoming\nput $(distpkg).tar.bz2\nput $(distpkg).tar.bz2.signature\nbye" | \
		ftp -n ftp.berlios.de

clean:
	find . -name '*~' | xargs rm || true

