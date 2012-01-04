" Vim syntax file
" Language:	Funtoo package.use files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo package.use files. Requires vim 6.3 or
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

syn region FuntooPackageUseComment start=/#/ end=/$/
	    \ contains=FuntooPackageUseEmail,FuntooPackageUseDate,FuntooBug

syn match  FuntooPackageUseEmail contained /<[a-zA-Z0-9\-\_]\+@[a-zA-Z0-9\-\_\.]\+>/
syn match  FuntooPackageUseDate  contained /(\(\d\d\?\s\w\+\|\w\+\s\d\d\?\)\s\d\{4\})/

syn match  FuntooPackageUseAtom /^[^ \t\n#]\+\S\+\/\S\+/
	    \ nextgroup=FuntooPackageUseUse,FuntooPackageUseUnuse skipwhite
syn match  FuntooPackageUseUse contained /[a-zA-Z0-9][a-zA-Z0-9\-_]*/
	    \ nextgroup=FuntooPackageUseUse,FuntooPackageUseUnuse skipwhite
syn match  FuntooPackageUseUnuse contained /-[a-zA-Z0-9][a-zA-Z0-9\-_]*/
	    \ nextgroup=FuntooPackageUseUse,FuntooPackageUseUnuse skipwhite

hi def link FuntooPackageUseComment          Comment
hi def link FuntooPackageUseEmail            Special
hi def link FuntooPackageUseDate             Number
hi def link FuntooPackageUseAtom             Identifier
hi def link FuntooPackageUseUse              Special
hi def link FuntooPackageUseUnuse            Keyword

let b:current_syntax = "funtoo-package-use"

