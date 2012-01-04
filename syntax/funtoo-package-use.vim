" Vim syntax file
" Language:	Gentoo package.use files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo package.use files. Requires vim 6.3 or
" later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/gentoo-common.vim

syn region GentooPackageUseComment start=/#/ end=/$/
	    \ contains=GentooPackageUseEmail,GentooPackageUseDate,GentooBug

syn match  GentooPackageUseEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  GentooPackageUseDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  GentooPackageUseAtom /^[^ \t\n#]\+\S\+\/\S\+/
	    \ nextgroup=GentooPackageUseUse,GentooPackageUseUnuse skipwhite
syn match  GentooPackageUseUse contained /[a-zA-Z0-9][a-zA-Z0-9\-_]*/
	    \ nextgroup=GentooPackageUseUse,GentooPackageUseUnuse skipwhite
syn match  GentooPackageUseUnuse contained /-[a-zA-Z0-9][a-zA-Z0-9\-_]*/
	    \ nextgroup=GentooPackageUseUse,GentooPackageUseUnuse skipwhite

hi def link GentooPackageUseComment          Comment
hi def link GentooPackageUseEmail            Special
hi def link GentooPackageUseDate             Number
hi def link GentooPackageUseAtom             Identifier
hi def link GentooPackageUseUse              Special
hi def link GentooPackageUseUnuse            Keyword

let b:current_syntax = "gentoo-package-use"

