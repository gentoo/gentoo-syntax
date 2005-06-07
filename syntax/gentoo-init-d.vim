" Vim syntax file
" Language:	Gentoo /etc/init.d/ scripts
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo /etc/init.d/ scripts. Inherits from sh.vim
" and adds in Gentoo-specific highlights for certain keywords and functions.
" Requires vim 6.3 or later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
    finish
endif

let is_bash=1
runtime! syntax/sh.vim
unlet b:current_syntax

runtime syntax/gentoo-common.vim
syn cluster shCommentGroup add=GentooBug

syn keyword GentooInitDKeyword need use provide before after ebegin eend einfo
syn keyword GentooInitDKeyword ewarn eerror

syn keyword GentooInitDFunc start stop reload restart usage zap depend

syn cluster shCommandSubList add=GentooInitDKeyword

hi def link GentooInitDKeyword Keyword
hi def link GentooInitDFunc    Special

let b:current_syntax = "gentoo-init-d"

