" Vim syntax file
" Language:	Funtoo Common Rules
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603
    finish
endif

syn region FuntooHeaderBlock start=/\%^\(#\)\@=/ end=/^$/ contains=FuntooHeader
syn region FuntooHeader contained start=/^#/ end=/$/ contains=FuntooHeaderCVSVar
syn region FuntooHeaderCVSVar contained start=/\$\S\+:/ end=/\$/

syn match  FuntooBug contained /\(\([fF]untoo \|[gG]entoo \|[dD]ebian \|[sS]ource[Ff]orge \)\?[Bb]ug \(#\s*\)\?\|#\)\d\{1,\}/

hi def link FuntooHeader                 Comment
hi def link FuntooHeaderCVSVar           PreProc
hi def link FuntooBug                    Underlined

