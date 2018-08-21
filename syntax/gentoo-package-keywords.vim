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

syn match  GentooPackageKeywordsKeyword contained /-\?[-~]\?\([a-z0-9\-]\+\|\*\)/
    \ nextgroup=GentooPackageKeywordsKeyword skipwhite
syn cluster GentooPackagePostAtom contains=GentooPackageKeywordsKeyword

hi def link GentooPackageKeywordsKeyword          Keyword

let b:current_syntax = "gentoo-package-keywords"
