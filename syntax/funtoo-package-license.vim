" Vim syntax file
" Language:	Funtoo package.license files
" Author:	Dror Levin <spatz@gentoo.org>
" Copyright:	Copyright (c) 2010 Dror Levin
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo package.license files. Requires vim 6.3 or
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

syn region FuntooPackageLicenseComment start=/#/ end=/$/
	    \ contains=FuntooPackageLicenseEmail,FuntooPackageLicenseDate,FuntooBug

syn match  FuntooPackageLicenseEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  FuntooPackageLicenseDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  FuntooPackageLicenseAtom /^[^ \t\n#]\+\S\+\/\S\+/
	    \ nextgroup=FuntooPackageLicenseLicense skipwhite
syn match  FuntooPackageLicenseLicense contained /-\?@\?\([a-zA-Z0-9\-_.+]\+\|\*\)/
	    \ nextgroup=FuntooPackageLicenseLicense skipwhite

hi def link FuntooPackageLicenseComment          Comment
hi def link FuntooPackageLicenseEmail            Special
hi def link FuntooPackageLicenseDate             Number
hi def link FuntooPackageLicenseAtom             Identifier
hi def link FuntooPackageLicenseLicense          Keyword

let b:current_syntax = "funtoo-package-license"

