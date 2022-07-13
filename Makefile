# Makefile for gentoo-syntax

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

tag:
	git tag -s v$$(( $$(git tag -l --sort=-creatordate | sed -n -e 's:^v::p' | head -n 1) + 1 ))

uninstall : uninstall-files

uninstall-files: $(foreach a, $(sort $(files)), \
	uninstall-file-$(subst /,_,$(a) ))

uninstall-file-%: $(subst _,/,$*)
	[ ! -f "$(PREFIX)/$(subst _,/,$*)" ] || rm "$(PREFIX)/$(subst _,/,$*)"

clean:
	find . -name '*~' | xargs rm || true
