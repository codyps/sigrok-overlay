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

DESCRIPTION="firmware for sigrok to use Cypress FX2 based devices such as Salae Logic"
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-2+"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-embedded/sdcc"

src_prepare() {
	if [ ${PV} = 9999 ]; then
		eautoreconf
	fi
}
