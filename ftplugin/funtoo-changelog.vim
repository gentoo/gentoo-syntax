" Vim filetype plugin file
" Language:	Funtoo ChangeLogs
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Sets up settings for Funtoo ChangeLogs as per GLEP 31.
"
" ported to Funtoo by Martin 'golodhrim' Scholz <golodhrim@funtoo.org>
"

if &compatible || v:version < 603
    finish
endif

" GLEP 31 settings
setlocal fileencoding=utf-8

