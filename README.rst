=============
gentoo-syntax
=============

A vim plugin that handles Gentoo and portage related syntax highlighting,
filetype, and indent settings.

Installing
==========

* Gentoo users: ``emerge app-vim/gentoo-syntax``
* Everyone else: ``make PREFIX=~/.vim/ install``

This plugin also provides a syntax checker for ebuilds and eclasses. To enable
it, you need to install Syntastic_ and pkgcheck_ first::

    # emerge app-vim/syntastic dev-util/pkgcheck

Then you'll need to configure Syntastic (see ``:help syntastic-quickstart``)
and add the following line to your .vimrc file::

    let g:syntastic_ebuild_checkers = ['pkgcheck']

To find non-POSIX code in OpenRC services, install ``dev-util/checkbashisms``
and enable it for filetype "sh"::

    let g:syntastic_sh_checkers = ['sh', 'checkbashisms']

.. _Syntastic: https://github.com/vim-syntastic/syntastic
.. _pkgcheck:  https://github.com/pkgcore/pkgcheck

Bugs
====

Please file issues or submit pull requests on github_.

.. _github: https://github.com/gentoo/gentoo-syntax

License
=======

You may redistribute this package under the same terms as Vim itself.
