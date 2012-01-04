" Vim syntax file
" Language:	Funtoo /etc/env.d/ files
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo /etc/env.d/ files. Inherits from sh.vim
" and adds in Funtoo-specific highlights for certain keywords and functions.
" Requires vim 6.3 or later.
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
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

runtime syntax/funtoo-common.vim
syn cluster shCommentGroup add=FuntooBug

let b:current_syntax = "funtoo-env-d"
