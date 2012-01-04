" Vim syntax file
" Language:	Funtoo package.keywords files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo package.keywords files. Requires vim 6.3 or
" later.
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/funtoo-common.vim

syn region FuntooPackageKeywordsComment start=/#/ end=/$/
	    \ contains=FuntooPackageKeywordsEmail,FuntooPackageKeywordsDate,FuntooBug

syn match  FuntooPackageKeywordsEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  FuntooPackageKeywordsDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  FuntooPackageKeywordsAtom /^[\ \t]*[^ \t\n#]\+\S\+\/\S\+/
	    \ nextgroup=FuntooPackageKeywordsKeyword skipwhite
syn match  FuntooPackageKeywordsKeyword contained /-\?[-~]\?\([a-z0-9\-]\+\|\*\)/
	    \ nextgroup=FuntooPackageKeywordsKeyword skipwhite

hi def link FuntooPackageKeywordsComment          Comment
hi def link FuntooPackageKeywordsEmail            Special
hi def link FuntooPackageKeywordsDate             Number
hi def link FuntooPackageKeywordsAtom             Identifier
hi def link FuntooPackageKeywordsKeyword          Keyword

let b:current_syntax = "funtoo-package-keywords"

