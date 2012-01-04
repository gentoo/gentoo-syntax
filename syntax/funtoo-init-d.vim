" Vim syntax file
" Language:	Funtoo /etc/init.d/ scripts
" Author:	Ciaran McCreesh <ciaranm@funtoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for Funtoo /etc/init.d/ scripts. Inherits from sh.vim
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

syn keyword FuntooInitDKeyword config need use before after provide keyword
syn keyword FuntooInitDKeyword ebegin vebegin eend veend ewend vewend
syn keyword FuntooInitDKeyword einfo veinfo ewarn vewarn eerror veerror
syn keyword FuntooInitDKeyword ewaitfile is_newer_than is_older_than
syn keyword FuntooInitDKeyword service_set_value service_get_value
syn keyword FuntooInitDKeyword service_started service_starting service_inactive
syn keyword FuntooInitDKeyword service_stopping service_stopped service_coldplugged
syn keyword FuntooInitDKeyword service_wasinactive service_started_daemon
syn keyword FuntooInitDKeyword mark_service_started mark_service_starting
syn keyword FuntooInitDKeyword mark_service_inactive mark_service_stopping
syn keyword FuntooInitDKeyword mark_service_stopped mark_service_coldplugged
syn keyword FuntooInitDKeyword mark_service_wasinactive checkpath yesno

syn keyword FuntooInitSpecialVariables extra_commands extra_started_commands extra_stopped_commands description command command_args pidfile name
syn keyword FuntooInitDeprecated opts

syn keyword FuntooInitDFunc describe start_pre start start_post stop_pre stop stop_post
syn keyword FuntooInitDFunc reload restart status zap depend

syn cluster shCommandSubList add=FuntooInitDKeyword

hi def link FuntooInitDKeyword Keyword
hi def link FuntooInitDFunc    Special
hi def link FuntooInitSpecialVariables PreProc
hi def link FuntooInitDeprecated Error

let b:current_syntax = "funtoo-init-d"
