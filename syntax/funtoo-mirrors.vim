" Vim syntax file
" Language:	Funtoo thirdpartymirrors files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo thirdpartymirrors files. Requires vim 6.3 or
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

syn region FuntooMirrorsComment start=/#/ end=/$/
	    \ contains=FuntooMirrorsEmail,FuntooMirrorsDate,FuntooBug

syn match  FuntooMirrorsEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  FuntooMirrorsDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  FuntooMirrorsAtom /^[^# \t]\+/
	    \ nextgroup=FuntooMirrorsUrl skipwhite
syn region FuntooMirrorsUrl contained start=/\(http\|ftp\):\/\// end=/\(\s\)\@=\|$/
	    \ nextgroup=FuntooMirrorsUrl skipwhite

hi def link FuntooMirrorsComment          Comment
hi def link FuntooMirrorsEmail            Special
hi def link FuntooMirrorsDate             Number
hi def link FuntooMirrorsAtom             Identifier
hi def link FuntooMirrorsUrl              String

let b:current_syntax = "funtoo-mirrors"

