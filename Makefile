# Makefile for gentoo-syntax

distapp = gentoo-syntax
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
	doc/gentoo-syntax.txt

files_ftdetect = \
	ftdetect/gentoo.vim

files_ftplugin = \
	ftplugin/ebuild.vim \
	ftplugin/gentoo-changelog.vim \
	ftplugin/gentoo-conf-d.vim \
	ftplugin/gentoo-env-d.vim \
	ftplugin/gentoo-init-d.vim \
	ftplugin/gentoo-make-conf.vim \
	ftplugin/gentoo-metadata.vim \
	ftplugin/gentoo-package-keywords.vim \
	ftplugin/gentoo-package-license.vim \
	ftplugin/gentoo-package-mask.vim \
	ftplugin/gentoo-package-properties.vim \
	ftplugin/gentoo-package-use.vim \
	ftplugin/gentoo-use-desc.vim

files_indent = \
	indent/ebuild.vim \
	indent/gentoo-metadata.vim

files_plugin = \
	plugin/gentoo-common.vim \
	plugin/newebuild.vim \
	plugin/newmetadata.vim \
	plugin/newinitd.vim

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
	syntax/gentoo-package-license.vim \
	syntax/gentoo-package-mask.vim \
	syntax/gentoo-package-properties.vim \
	syntax/gentoo-package-use.vim \
	syntax/gentoo-use-desc.vim \
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
	git tag $(distpkg)
	@echo "tag created, remember to push it"

clean:
	find . -name '*~' | xargs rm || true
