# Copyright 1999-2013 Gentoo Foundation
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

DESCRIPTION="firmware for sigrok to use the asix-sigma and nexus-osciprime"
HOMEPAGE="http://sigrok.org/"

LICENSE="as-is"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

if [ ${PV} = 9999 ]; then
src_prepare() {
		eautoreconf
}
fi
