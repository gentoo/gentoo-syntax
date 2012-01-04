" Vim syntax file
" Language:	Funtoo ChangeLogs
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo ChangeLogs. Needs vim 6.3 or later.
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

" Releases
syn region FuntooChangeLogRelease start=/^\*/ end=/$/ contains=FuntooChangeLogReleaseDate
syn match FuntooChangeLogReleaseDate contained /(\d\d\s\w\+\s\d\{4\})/

" Entries
syn region FuntooChangeLogEntry start=/^\s\+/ end=/\n\n/
	    \ contains=FuntooChangeLogEntryDate,FuntooBug
syn region FuntooChangeLogEntryDate contained start=/\d\?\d\s\w\+\s\d\{4\}/ end=/;/
	    \ nextgroup=FuntooChangeLogEntryAuthor,FuntooChangeLogEntryEmail skipwhite skipnl
syn region FuntooChangeLogEntryAuthor contained start=/\S/ end=/\( <\)\@=/
	    \ nextgroup=FuntooChangeLogEntryEmail skipwhite skipnl
syn match  FuntooChangeLogEntryEmail contained /<\?[a-zA-Z0-9\.\-\_]\+@[a-zA-Z0-9\.\-\_]\+>\?/
	    \ nextgroup=FuntooChangeLogFiles skipwhite skipnl
syn region FuntooChangeLogFiles contained start=/\(\S\)\@=/ end=/:/
	    \ contains=FuntooChangeLogAddFile,FuntooChangeLogDelFile,FuntooChangeLogModFile

" Add / delete / changed files
syn region FuntooChangeLogAddFile contained start=/+/ end=/\([,:]\)\@=/
syn region FuntooChangeLogDelFile contained start=/-/ end=/\([,:]\)\@=/
syn region FuntooChangeLogModFile contained start=/[a-zA-Z0-9]/ end=/\([,:]\)\@=/

" Colours
hi def link FuntooChangeLogEntryDate        Number
hi def link FuntooChangeLogEntryAuthor      String
hi def link FuntooChangeLogEntryEmail       Special
hi def link FuntooChangeLogModFile          Identifier
hi def link FuntooChangeLogAddFile          DiffAdd
hi def link FuntooChangeLogDelFile          DiffDelete

hi def link FuntooChangeLogRelease          Title
hi def link FuntooChangeLogReleaseDate      Number

let b:current_syntax = "funtoo-changelog"

