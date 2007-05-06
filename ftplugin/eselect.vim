" Vim filetype plugin file
" Language:	 Eselect Module (bash)
" Author:	 Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright: Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	 You may redistribute this under the same terms as Vim itself
"
" This sets up filetype specific options for eselect modules.  These settings
" were pwned from ebuild.vim, but they wfm ..
"

if &compatible || v:version < 603
  finish
endif

runtime! ftplugin/sh.vim

" Will-do-for-now whitespace settings
setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab
setlocal textwidth=80

" GLEP 31 settings (??)
setlocal fileencoding=utf-8

" vim: sw=4 ts=4 et fdm=marker
