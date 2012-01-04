# Makefile for funtoo-syntax

distapp = funtoo-syntax
distver := $(shell date -u +%Y%m%d)
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
	doc/funtoo-syntax.txt

files_ftdetect = \
	ftdetect/funtoo.vim \
	ftplugin/ebuild.vim

files_ftplugin = \
	ftplugin/funtoo-changelog.vim \
	ftplugin/funtoo-metadata.vim

files_indent = \
	indent/ebuild.vim \
	indent/funtoo-metadata.vim

files_plugin = \
	plugin/bugsummary.vim \
	plugin/funtoo-common.vim \
	plugin/newebuild.vim \
	plugin/newmetadata.vim \
	plugin/newinitd.vim

files_syntax = \
	syntax/ebuild.vim \
	syntax/funtoo-changelog.vim \
	syntax/funtoo-common.vim \
	syntax/funtoo-conf-d.vim \
	syntax/funtoo-env-d.vim \
	syntax/funtoo-init-d.vim \
	syntax/funtoo-make-conf.vim \
	syntax/funtoo-metadata.vim \
	syntax/funtoo-mirrors.vim \
	syntax/funtoo-package-keywords.vim \
	syntax/funtoo-package-license.vim \
	syntax/funtoo-package-mask.vim \
	syntax/funtoo-package-properties.vim \
	syntax/funtoo-package-use.vim \
	syntax/funtoo-use-desc.vim \
	syntax/glep.vim \
	syntax/guidexml.vim

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

tag:
	git tag $(distver)

dist: tag
	mkdir "$(distpkg)"
	$(MAKE) PREFIX="$(distpkg)" install
	cp README "$(distpkg)/"
	tar jcf "$(distpkg).tar.bz2" "$(distpkg)"
	rm -fr "$(distpkg)/"

clean:
	find . -name '*~' | xargs rm || true

