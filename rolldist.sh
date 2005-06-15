#!/bin/bash

prog="${foo/*\/}"
die() { echo >&2 "${prog}: error: $@"; exit 1; }

if [[ $# < 2 ]]; then
	echo "usage: ${prog} [source-dir] [new-version]"
	exit 0
fi

[[ -d $1 ]] || die "directory '$1' does not exist, or is not a directory"
srcdir="`realpath $1`" || die "realpath failed"
relver="$2"

tmpdir=`mktemp -d /tmp/.gentoo-syntax-release.XXXXXXXXXX`
if [ $? -ne 0 ]; then
	[[ ${tmpdir} != x ]] && rm -f ${tmpdir} 2>/dev/null
	die "mktemp failed"
fi

trap 'rm -rf ${tmpdir}' 1 2 3 6 9 15
oldwd="`pwd`"
tmpreldir="${tmpdir}/gentoo-syntax-${relver}"
cd "${tmpdir}" || die "cd '${tmpdir}' failed"
mkdir -p "${tmpreldir}"

if type -p rsync &>/dev/null; then
	rsync \
	-aqc --exclude=CVS --exclude=.svn \
	"${srcdir}/" "${tmpreldir}" || die "rsync failed"
else
	cp -a "${srcdir}"/* "${srcdir}"/.[a-z0-9]* \
		"${tmpreldir}" || die "cp failed"
	find "${tmpreldir}" \
		\( -name .svn -or -name CVS \) -print \
		|xargs --no-run-if-empty rm -r \
		|| die "find '${tmpreldir}' failed"
fi

tar -jcpf gentoo-syntax-${relver}{.tar.bz2,/} || die "tar failed"
mv -f gentoo-syntax-${relver}.tar.bz2 "${oldwd}" || dir "mv failed"
rm -rf ${tmpdir}

echo "gentoo-syntax-${relver}.tar.bz2 rolled and ready .. ;)"

# vim: ts=4 sw=4 noet
