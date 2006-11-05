" Vim syntax file
" Language:	Gentoo package.mask and package.unmask files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo package.mask and package.unmask files.
" Requires vim 6.3 or later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/gentoo-common.vim

" Header
syn region GentooPackageMaskComment start=/#/ end=/$/
	    \ contains=GentooPackageMaskEmail,GentooPackageMaskDate,GentooBug

syn match  GentooPackageMaskEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  GentooPackageMaskDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  GentooPackageMaskAtom /^[^ \t\n#]\+\S\+\/\S\+/

hi def link GentooPackageMaskComment          Comment
hi def link GentooPackageMaskEmail            Special
hi def link GentooPackageMaskDate             Number
hi def link GentooPackageMaskAtom             Identifier

let b:current_syntax = "gentoo-package-mask"

