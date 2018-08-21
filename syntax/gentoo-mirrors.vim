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

runtime syntax/gentoo-package-common.vim

syn match  GentooMirrorsAtom /^[^# \t]\+/
    \ nextgroup=GentooMirrorsUrl skipwhite
syn region GentooMirrorsUrl contained start=/\(http\|ftp\):\/\// end=/\(\s\)\@=\|$/
    \ nextgroup=GentooMirrorsUrl skipwhite

hi def link GentooMirrorsAtom             Identifier
hi def link GentooMirrorsUrl              String

let b:current_syntax = "gentoo-mirrors"
