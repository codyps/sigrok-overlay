# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils autotools

if [ ${PV} = 9999 ]; then
	EGIT_REPO_URI="git://sigrok.org/${PN}"
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="http://sigrok.org/download/source/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Library which provides (streaming) protocol decoding functionality."
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

# >=automake-1.11
RDEPEND=">=dev-libs/glib-2.24.0
	>=dev-lang/python-3"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
#	>=dev-util/pkgconfig-0.22"

src_prepare() {
	if [ ${PV} = 9999 ]; then
		eautoreconf
	fi
}

src_configure() {
	local py3ver

	py3ver="$(python3 -V 2>&1 | sed -e 's/Python\ //' -e 's/\([0-9]\+\.[0-9]\+\).*/\1/')"

	PYTHON3_CONFIG=python-config-${py3ver} econf
}
