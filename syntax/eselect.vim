" Vim syntax file
" Language:     Gentoo Eselect modules/libs
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>,
"            Elfyn McBratney <beu@gentoo.org>
" Copyright: Copyright (c) 2004-2005 Ciaran McCreesh,
"            Copyright (c) 2005 Elfyn McBratney
" Licence:      You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for ebuilds and eclasses. Inherits from sh.vim and adds
" in Gentoo-specific highlights for certain keywords and functions. Requires
" vim 6.3 or later.
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

"runtime syntax/gentoo-common.vim

" function names can contain more characters than sh.vim allows. Override
" this. See Gentoo bug 72469.
syn match bkshFunction "^\s*\<\h[0-9a-zA-Z_\-\.]*\>\s*()"      skipwhite skipnl contains=bkshFunctionParen

" Core keywords
syn keyword EselectCoreKeyword die is_function has

" Config keywords
syn keyword EselectConfigKeyword store_config load_config add_config

" (String/misc) manipulation keywords
syn keyword EselectManipKeyword svn_date_to_version

" Multilib keywords
syn keyword EselectMultilibKeyword list_libdirs

" Output keywords
syn keyword EselectOutputKeywords write_error_msg write_list_start
syn keyword EselectOutputKeywords write_kv_list_entry write_numbered_list_entry
syn keyword EselectOutputKeywords write_numbered_list highlight
syn keyword EselectOutputKeywords highlight_warning space

" Test keywords
syn keyword EselectTestKeywords is_number

" clusters
syn cluster EselectThings contains=EselectCoreKeyword,EselectConfigKeyword
syn cluster EselectThings add=EselectManipKeyword,EselectMultilibKeyword,
syn cluster EselectThings add=EselectOutputKeywords,EselectTestKeywords

syn cluster shCommandSubList add=@EselectThings

hi def link EselectCoreKeyword        Keyword
hi def link EselectConfigKeyword      Identifier
hi def link EselectManipKeyword       Identifier
hi def link EselectMultilibKeyword    Identifier
hi def link EselectOutputKeyword      Identifier
hi def link EselectTestKeyword        Identifier

let b:current_syntax = "eselect"

" vim: sw=4 ts=4 et fdm=marker
