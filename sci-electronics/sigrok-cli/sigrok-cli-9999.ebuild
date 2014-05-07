# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

#WANT_AUTOCONF="latest" # 2.63 or newer
#WANT_AUTOMAKE="latest" # 1.11 or newer
inherit eutils autotools

if [ ${PV} = 9999 ]; then
	EGIT_REPO_URI="git://sigrok.org/${PN}"
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="http://sigrok.org/download/source/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Command-line client for the sigrok logic analyzer software"
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE="+sigrokdecode"

RDEPEND=">=sci-electronics/libsigrok-0.3.0
	sigrokdecode? ( >=sci-electronics/libsigrokdecode-0.3.0 )
	>=dev-libs/glib-2.28.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"
# >=dev-util/pkgconfig-0.22

src_prepare() {
	if [ ${PV} = 9999 ]; then
		eautoreconf
	fi
}

src_configure() {
	econf $(use_with sigrokdecode libsigrokdecode)
}
