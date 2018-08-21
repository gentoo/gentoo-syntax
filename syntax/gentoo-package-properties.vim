" Vim syntax file
" Language:	Gentoo package.keywords files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo package.keywords files. Requires vim 6.3 or
" later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
    finish
endif

runtime syntax/gentoo-package-common.vim

syn match  GentooPackagePropertiesAtom /^[^ \t\n#]\+\S\+\/\S\+/
    \ nextgroup=GentooPackagePropertiesProperty skipwhite
syn match  GentooPackagePropertiesProperty contained /-\?\([a-zA-Z0-9\-_]\+\|\*\)/
    \ nextgroup=GentooPackagePropertiesProperty skipwhite

hi def link GentooPackagePropertiesAtom             Identifier
hi def link GentooPackagePropertiesProperty         Keyword

let b:current_syntax = "gentoo-package-properties"

