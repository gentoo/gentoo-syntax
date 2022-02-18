" Syntax checking plugin for syntastic
" Language:	Gentoo Ebuilds/Eclasses
" Author:	Anna Vyalkova <cyber+gentoo@sysrq.in>
" Copyright:	Copyright (c) 2022 Anna Vyalkova
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax checker for ebuilds and eclasses powered by pkgcheck.
" Requires vim 7.0.175 or later.
"

if exists('g:loaded_syntastic_ebuild_pkgcheck_checker')
    finish
endif
let g:loaded_syntastic_ebuild_pkgcheck_checker = 1

let s:save_cpo = &cpo
set cpo&vim

function! SyntaxCheckers_ebuild_pkgcheck_GetLocList() dict
    let makeprg = self.makeprgBuild({
	\ 'args_before': 'scan',
	\ 'args': '-R FormatReporter',
	\ 'args_after': '--format "{lineno}:{level}:{name}: {desc}"' })

    let errorformat =
        \ '%l:%tnfo:%m,'    . ':%tnfo:%m,' .
        \ '%W%l:style:%m,'  . '%W:style:%m,' .
        \ '%l:%tarning:%m,' . ':%tarning:%m,' .
        \ '%l:%trror:%m,'   . ':%trror:%m'

    let loclist = SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
        \ 'defaults': {'bufnr': bufnr(''), 'type': 'E', 'text': 'Syntax error'},
        \ 'returns': [0, 1] })

    for e in loclist
        if e['valid'] && e['lnum'] == 0
            let e['lnum'] = str2nr(matchstr(e['text'], '\m\<lines\? \zs\d\+\ze'))
        endif
    endfor

    return loclist
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'ebuild',
    \ 'name': 'pkgcheck',
    \ 'exec': 'pkgcheck'})

let &cpo = s:save_cpo
unlet s:save_cpo
