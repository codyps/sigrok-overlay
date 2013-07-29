# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils autotools

if [ ${PV} = 9999 ]; then
	inherit git-2
	EGIT_REPO_URI="git://sigrok.org/${PN}"
	KEYWORDS=""
else
	SRC_URI="http://sigrok.org/download/source/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Command-line client for the sigrok logic analyzer software"
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE="+decode"

# >=automake-1.11
# >=autoconf-2.63
RDEPEND=">=sci-electronics/libsigrok-0.2.0
	decode? ( >=sci-electronics/libsigrokdecode-0.2.0 )
	>=dev-libs/glib-2.28.0"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.22"

if [ ${PV} = 9999 ]; then
src_prepare() {
	eautoreconf
}
fi

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
