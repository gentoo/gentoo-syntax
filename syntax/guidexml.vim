" Vim syntax file
" Language:	Gentoo guidexml
" Author:	Ciaran McCreesh <ciaranm@gentoo.org>
" Copyright:	Copyright (c) 2004-2005 Ciaran McCreesh
" Licence:	You may redistribute this under the same terms as Vim itself
"
" Syntax highlighting for guidexml.xml. Inherits from xml.vim.
"

if &compatible || v:version < 603
    finish
endif

if exists("b:current_syntax")
    finish
endif

runtime! syntax/xml.vim
unlet b:current_syntax

syn cluster xmlTagHook add=guidexmlElement
syn keyword guidexmlElement contained mainpage guide news title subtitle
syn keyword guidexmlElement contained poster author abstract summary license
syn keyword guidexmlElement contained glsaindex glsa-latest version date
syn keyword guidexmlElement contained chapter section body figure fig img
syn keyword guidexmlElement contained br note impo warn pre p table tcolumn
syn keyword guidexmlElement contained tr th ti ul ol li b brite box c codenote
syn keyword guidexmlElement contained e i path mail uri

syn cluster xmlAttribHook add=guidexmlAttr
syn match guidexmlAttr contained /about\|articles\|author\|caption\|category\|changelog/
syn match guidexmlAttr contained /contract\|docs\|gentoo\|graphics\|id\|irc\|lang\|link/
syn match guidexmlAttr contained /linkto\|lists\|news\|newsletter\|packages\|performace/
syn match guidexmlAttr contained /projects\|short\|shots\|sponsors\|src\|support\|title/
syn match guidexmlAttr contained /type\|where\|width/

hi def link guidexmlElement Keyword
hi def link guidexmlAttr    Keyword

let b:current_syntax = "guidexml"

