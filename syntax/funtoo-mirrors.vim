" Vim syntax file
" Language:	Gentoo thirdpartymirrors files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo thirdpartymirrors files. Requires vim 6.3 or
" later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/gentoo-common.vim

syn region GentooMirrorsComment start=/#/ end=/$/
	    \ contains=GentooMirrorsEmail,GentooMirrorsDate,GentooBug

syn match  GentooMirrorsEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  GentooMirrorsDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  GentooMirrorsAtom /^[^# \t]\+/
	    \ nextgroup=GentooMirrorsUrl skipwhite
syn region GentooMirrorsUrl contained start=/\(http\|ftp\):\/\// end=/\(\s\)\@=\|$/
	    \ nextgroup=GentooMirrorsUrl skipwhite

hi def link GentooMirrorsComment          Comment
hi def link GentooMirrorsEmail            Special
hi def link GentooMirrorsDate             Number
hi def link GentooMirrorsAtom             Identifier
hi def link GentooMirrorsUrl              String

let b:current_syntax = "gentoo-mirrors"

