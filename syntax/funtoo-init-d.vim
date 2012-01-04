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
" TODO: Add highlights for description_$command
"       Add start-stop-daemon highlighting incl. deprecated options
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

syn keyword GentooInitDKeyword config need use before after provide keyword
syn keyword GentooInitDKeyword ebegin vebegin eend veend ewend vewend
syn keyword GentooInitDKeyword einfo veinfo ewarn vewarn eerror veerror
syn keyword GentooInitDKeyword ewaitfile is_newer_than is_older_than
syn keyword GentooInitDKeyword service_set_value service_get_value
syn keyword GentooInitDKeyword service_started service_starting service_inactive
syn keyword GentooInitDKeyword service_stopping service_stopped service_coldplugged
syn keyword GentooInitDKeyword service_wasinactive service_started_daemon
syn keyword GentooInitDKeyword mark_service_started mark_service_starting
syn keyword GentooInitDKeyword mark_service_inactive mark_service_stopping
syn keyword GentooInitDKeyword mark_service_stopped mark_service_coldplugged
syn keyword GentooInitDKeyword mark_service_wasinactive checkpath yesno

syn keyword GentooInitSpecialVariables extra_commands extra_started_commands extra_stopped_commands description command command_args pidfile name
syn keyword GentooInitDeprecated opts

syn keyword GentooInitDFunc describe start_pre start start_post stop_pre stop stop_post
syn keyword GentooInitDFunc reload restart status zap depend

syn cluster shCommandSubList add=GentooInitDKeyword

hi def link GentooInitDKeyword Keyword
hi def link GentooInitDFunc    Special
hi def link GentooInitSpecialVariables PreProc
hi def link GentooInitDeprecated Error

let b:current_syntax = "gentoo-init-d"

