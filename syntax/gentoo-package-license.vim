" Vim syntax file
" Language:	Gentoo package.license files
" Author:	Dror Levin <spatz@gentoo.org
" Copyright:	Copyright (c) 2010 Dror Levin
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo package.license files. Requires vim 6.3 or
" later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
    finish
endif

runtime syntax/gentoo-package-common.vim

syn match  GentooPackageLicenseAtom /^[^ \t\n#]\+\S\+\/\S\+/
    \ nextgroup=GentooPackageLicenseLicense skipwhite
syn match  GentooPackageLicenseLicense contained /-\?@\?\([a-zA-Z0-9\-_.+]\+\|\*\)/
    \ nextgroup=GentooPackageLicenseLicense skipwhite

hi def link GentooPackageLicenseAtom             Identifier
hi def link GentooPackageLicenseLicense          Keyword

let b:current_syntax = "gentoo-package-license"
