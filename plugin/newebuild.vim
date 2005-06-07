" Vim plugin
" Purpose:      Intelligently create content for new ebuild files
" Author:       Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:    Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:      You may redistribute this under the same terms as Vim itself

if &compatible || v:version < 603
    finish
endif

runtime! plugin/gentoo-common.vim

fun! <SID>MakeNewEbuild()
    let l:pastebackup = &paste
    set nopaste

    " {{{ variables
    let l:arch = GentooGetArch()
    let l:filename = expand("%:p")
    let l:category = substitute(l:filename,
                \ "^.*/\\([^/]\\+\\)/[^/]\\+/[^/]\\+\\.ebuild", "\\1", "g")
    " }}}

    call GentooHeader()

    if expand("%:e") =~# "eclass\$"
        " {{{ eclass special setup
        let l:eclass=substitute(expand("%:t"), "\\.eclass\$", "", "")
        put ='#'
        put ='# Original Author: ' . GentooGetUser()
        put ='# Purpose: '
        put ='#'
        put =''
        put ='ECLASS=\"' . l:eclass . '\"'
        put ='INHERITED=\"$INHERITED $ECLASS\"'
        put =''
        " }}}

        " {{{ go to the first thing to edit
        0
        /^# Purpose:/
        normal $
        nohls
        " }}}
    else
        if l:category ==# "app-vim"
            " {{{ app-vim special setup
            put ='inherit vim-plugin'
            put =''
            put ='DESCRIPTION=\"vim plugin: \"'
            put ='HOMEPAGE=\"http://www.vim.org/scripts/script.php?script_id=\"'
            put ='LICENSE=\"\"'
            put ='KEYWORDS=\"~' . l:arch . '\"'
            put ='IUSE=\"\"'
            put =''
            put ='VIM_PLUGIN_HELPFILES=\"\"'
            put ='VIM_PLUGIN_HELPTEXT=\"\"'
            put ='VIM_PLUGIN_HELPURI=\"\"'
            put ='VIM_PLUGIN_MESSAGES=\"\"'
            put =''
            " }}}
        elseif l:category ==# "www-apache" && expand("%:t") =~# "^mod_"
            " {{{ www-apache default setup (for module pkgs)
            put ='inherit apache-module'
            put =''
            put ='DESCRIPTION=\"\"'
            put ='HOMEPAGE=\"\"'
            put ='LICENSE=\"\"'
            put =''
            put ='KEYWORDS=\"~' . l:arch . '\"'
            put ='IUSE=\"\"'
            put ='SLOT=\"0\"'
            put =''
            put ='# See apache-module.eclass for more information.'
            put ='APACHE2_MOD_CONF=\"XX_${PN}\"'
            put ='APACHE2_MOD_DEFINE=\"\"'
            put =''
            put ='need_apache2'
            " }}}
        else
            " {{{ standard default setup
            " {{{ extra inherits for some categories
            if l:category =~# "^games-"
                put ='inherit games'
                put =''
            elseif l:category ==# "dev-python"
                put ='inherit distutils'
                put =''
            elseif l:category ==# "dev-java"
                put ='inherit java-pkg'
                put =''
            elseif l:category ==# "dev-perl"
                put ='inherit perl-module'
                put =''
            endif
            " }}}

            put ='DESCRIPTION=\"\"'
            put ='HOMEPAGE=\"\"'
            put ='SRC_URI=\"\"'
            put =''
            put ='LICENSE=\"\"'
            put ='SLOT=\"0\"'
            put ='KEYWORDS=\"~' . l:arch . '\"'
            put ='IUSE=\"\"'
            put =''

            " {{{ extra deps for some categories
            if l:category ==# "dev-java"
                put ='DEPEND=\"virtual/jdk\"'
                put ='RDEPEND=\"virtual/jre\"'
                put =''
            else
                put ='DEPEND=\"\"'
                put ='RDEPEND=\"\"'
                put =''
            endif
            " }}}
            " }}}
        endif

        " {{{ go to the first thing to edit
        0
        /^DESCRIPTION=/
        exec "normal 2f\""
        nohls
        " }}}
    endif

    if pastebackup == 0
        set nopaste
    endif
endfun

com! -nargs=0 NewEbuild call <SID>MakeNewEbuild()

augroup NewEbuild
    au!
    autocmd BufNewFile *.e{build,class}
                \ call <SID>MakeNewEbuild()
augroup END

" vim: set et foldmethod=marker : "
