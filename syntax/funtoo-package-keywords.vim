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

runtime syntax/gentoo-common.vim

syn region GentooPackageKeywordsComment start=/#/ end=/$/
	    \ contains=GentooPackageKeywordsEmail,GentooPackageKeywordsDate,GentooBug

syn match  GentooPackageKeywordsEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  GentooPackageKeywordsDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  GentooPackageKeywordsAtom /^[\ \t]*[^ \t\n#]\+\S\+\/\S\+/
	    \ nextgroup=GentooPackageKeywordsKeyword skipwhite
syn match  GentooPackageKeywordsKeyword contained /-\?[-~]\?\([a-z0-9\-]\+\|\*\)/
	    \ nextgroup=GentooPackageKeywordsKeyword skipwhite

hi def link GentooPackageKeywordsComment          Comment
hi def link GentooPackageKeywordsEmail            Special
hi def link GentooPackageKeywordsDate             Number
hi def link GentooPackageKeywordsAtom             Identifier
hi def link GentooPackageKeywordsKeyword          Keyword

let b:current_syntax = "gentoo-package-keywords"

