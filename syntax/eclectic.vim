" Vim syntax file
" Language:     Gentoo Ebuilds/Eclasses
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
syn keyword EclecticCoreKeyword die is_function has

" Config keywords
syn keyword EclecticConfigKeyword store_config load_config add_config

" (String/misc) manipulation keywords
syn keyword EclecticManipKeyword svn_date_to_version

" Multilib keywords
syn keyword EclecticMultilibKeyword list_libdirs

" Output keywords
syn keyword EclecticOutputKeywords write_error_msg write_list_start
syn keyword EclecticOutputKeywords write_kv_list_entry write_numbered_list_entry
syn keyword EclecticOutputKeywords write_numbered_list highlight
syn keyword EclecticOutputKeywords highlight_warning space

" Test keywords
syn keyword EclecticTestKeywords is_number

" clusters
syn cluster EclecticThings contains=EclecticCoreKeyword,EclecticConfigKeyword
syn cluster EclecticThings add=EclecticManipKeyword,EclecticMultilibKeyword,
syn cluster EclecticThings add=EclecticOutputKeywords,EclecticTestKeywords

syn cluster shCommandSubList add=@EclecticThings

hi def link EclecticCoreKeyword        Keyword
hi def link EclecticConfigKeyword      Identifier
hi def link EclecticManipKeyword       Identifier
hi def link EclecticMultilibKeyword    Identifier
hi def link EclecticOutputKeyword      Identifier
hi def link EclecticTestKeyword        Identifier

let b:current_syntax = "eclectic"

" vim: sw=4 ts=4 et fdm=marker
