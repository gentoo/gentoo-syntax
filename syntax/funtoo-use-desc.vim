" Vim syntax file
" Language:	Funtoo use.desc, use.local.desc files
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

syn region FuntooUseDescComment start=/#/ end=/$/
	    \ contains=FuntooBug

syn match FuntooUseDescPackage /^\(#\)\@!\([a-zA-Z0-9\-\_+\.]\+\/[a-zA-Z0-9\-\_+]\+\)\?/ nextgroup=FuntooUseDescColon,FuntooUseDescFlag skipwhite
syn match FuntooUseDescColon /:/ contained nextgroup=FuntooUseDescFlag
syn match FuntooUseDescFlag contained /[a-zA-Z0-9\-\_+@:]\+/ nextgroup=FuntooUseDescDash skipwhite
syn match FuntooUseDescDash /-\s*/ contained nextgroup=FuntooUseDescDesc skipwhite
syn region FuntooUseDescDesc start=// end=/$/ contained skipwhite

hi def link FuntooUseDescComment          Comment
hi def link FuntooUseDescPackage          Keyword
hi def link FuntooUseDescFlag             Identifier
hi def link FuntooUseDescDesc             String

let b:current_syntax = "funtoo-package-keywords"

