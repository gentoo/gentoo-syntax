" Vim syntax file
" Language:	Funtoo package.mask and package.unmask files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo package.mask and package.unmask files.
" Requires vim 6.3 or later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/funtoo-common.vim

" Header
syn region FuntooPackageMaskComment start=/#/ end=/$/
	    \ contains=FuntooPackageMaskEmail,FuntooPackageMaskDate,FuntooBug

syn match  FuntooPackageMaskEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  FuntooPackageMaskDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  FuntooPackageMaskAtom /^[^ \t\n#]\+\S\+\/\S\+/

hi def link FuntooPackageMaskComment          Comment
hi def link FuntooPackageMaskEmail            Special
hi def link FuntooPackageMaskDate             Number
hi def link FuntooPackageMaskAtom             Identifier

let b:current_syntax = "funtoo-package-mask"

