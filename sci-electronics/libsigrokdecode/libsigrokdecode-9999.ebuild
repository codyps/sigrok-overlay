# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# TODO: need to control detection of check and libsigrok
#       OR just a way to disable tests



EAPI=5

# libsigrokdecode-0.2.0 supports python3_1 and python3_0, but those are gone
# from portage, so we don't bother with a second ebuild
PYTHON_COMPAT=( python3_{2,3,4} )
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

src_compile() {
	# Bug in <= 0.3.0 trys to run tests before lib is complete if parallelization is on.
	emake -j1
}
