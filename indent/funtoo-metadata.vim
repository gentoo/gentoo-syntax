" Vim syntax file
" Language:	Funtoo metadata.xml
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for metadata.xml
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603
    finish
endif

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif

runtime! indent/xml.vim
let b:did_indent = 1


" vim: set sts=2 sw=2:
