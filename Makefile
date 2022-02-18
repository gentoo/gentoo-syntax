# Makefile for gentoo-syntax

distapp = gentoo-syntax
distver := $(shell date -u +%Y%m%d)
distpkg := $(distapp)-$(distver)

PREFIX = ${HOME}/.vim/

files = $(wildcard \
	doc/* \
	ftdetect/* \
	ftplugin/* \
	indent/* \
	plugin/* \
	syntax/* \
	syntax_checkers/* \
)

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
	git tag -s $(distpkg)
	@echo "tag created, remember to push it"

clean:
	find . -name '*~' | xargs rm || true
