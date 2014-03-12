# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_{1,2,3,4} )
inherit eutils autotools python-single-r1

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


REQUIRED_USE="${PYTHON_REQUIRED_USE}"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

# >=automake-1.11
RDEPEND=">=dev-libs/glib-2.24.0
	${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
#	>=dev-util/pkgconfig-0.22"

pkg_setup () {
	python-single-r1_pkg_setup
}

src_prepare() {
	if [ ${PV} = 9999 ]; then
		eautoreconf
	fi
}
