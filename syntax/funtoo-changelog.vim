" Vim syntax file
" Language:	Gentoo ChangeLogs
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Gentoo ChangeLogs. Needs vim 6.3 or later.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
  finish
endif

runtime syntax/gentoo-common.vim

" Releases
syn region GentooChangeLogRelease start=/^\*/ end=/$/ contains=GentooChangeLogReleaseDate
syn match GentooChangeLogReleaseDate contained /(\d\d\s\w\+\s\d\{4\})/

" Entries
syn region GentooChangeLogEntry start=/^\s\+/ end=/\n\n/
	    \ contains=GentooChangeLogEntryDate,GentooBug
syn region GentooChangeLogEntryDate contained start=/\d\?\d\s\w\+\s\d\{4\}/ end=/;/
	    \ nextgroup=GentooChangeLogEntryAuthor,GentooChangeLogEntryEmail skipwhite skipnl
syn region GentooChangeLogEntryAuthor contained start=/\S/ end=/\( <\)\@=/
	    \ nextgroup=GentooChangeLogEntryEmail skipwhite skipnl
syn match  GentooChangeLogEntryEmail contained /<\?[a-zA-Z0-9\.\-\_]\+@[a-zA-Z0-9\.\-\_]\+>\?/
	    \ nextgroup=GentooChangeLogFiles skipwhite skipnl
syn region GentooChangeLogFiles contained start=/\(\S\)\@=/ end=/:/
	    \ contains=GentooChangeLogAddFile,GentooChangeLogDelFile,GentooChangeLogModFile

" Add / delete / changed files
syn region GentooChangeLogAddFile contained start=/+/ end=/\([,:]\)\@=/
syn region GentooChangeLogDelFile contained start=/-/ end=/\([,:]\)\@=/
syn region GentooChangeLogModFile contained start=/[a-zA-Z0-9]/ end=/\([,:]\)\@=/

" Colours
hi def link GentooChangeLogEntryDate        Number
hi def link GentooChangeLogEntryAuthor      String
hi def link GentooChangeLogEntryEmail       Special
hi def link GentooChangeLogModFile          Identifier
hi def link GentooChangeLogAddFile          DiffAdd
hi def link GentooChangeLogDelFile          DiffDelete

hi def link GentooChangeLogRelease          Title
hi def link GentooChangeLogReleaseDate      Number

let b:current_syntax = "gentoo-changelog"

