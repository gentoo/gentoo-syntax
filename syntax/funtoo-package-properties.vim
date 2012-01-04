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

syn region FuntooPackagePropertiesComment start=/#/ end=/$/
	    \ contains=FuntooPackagePropertiesEmail,FuntooPackagePropertiesDate,FuntooBug

syn match  FuntooPackagePropertiesEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  FuntooPackagePropertiesDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  FuntooPackagePropertiesAtom /^[^ \t\n#]\+\S\+\/\S\+/
	    \ nextgroup=FuntooPackagePropertiesProperty skipwhite
syn match  FuntooPackagePropertiesProperty contained /-\?\([a-zA-Z0-9\-_]\+\|\*\)/
	    \ nextgroup=FuntooPackagePropertiesProperty skipwhite

hi def link FuntooPackagePropertiesComment          Comment
hi def link FuntooPackagePropertiesEmail            Special
hi def link FuntooPackagePropertiesDate             Number
hi def link FuntooPackagePropertiesAtom             Identifier
hi def link FuntooPackagePropertiesProperty         Keyword

let b:current_syntax = "funtoo-package-properties"

