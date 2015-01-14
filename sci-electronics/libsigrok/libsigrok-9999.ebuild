# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 python3_2 python3_3 python3_4 )

inherit eutils autotools python-single-r1

if [ ${PV} = 9999 ]; then
	EGIT_REPO_URI="git://sigrok.org/${PN}"
	inherit git-2
	KEYWORDS=""
else
	SRC_URI="http://sigrok.org/download/source/${PN}/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="provide basic hardware drivers for logic analyzers and input/output file format support"
HOMEPAGE="http://sigrok.org/"

LICENSE="GPL-3"
SLOT="0"
IUSE="+udev +alsa +usb +ftdi +cxx +python"

# Not encoded in RDEPEND because the virtual doesn't know about versions.
# >=dev-libs/libusb-1.0.9

REQUIRED_USE="python? ( cxx )"

RDEPEND="
	dev-libs/libserialport
	>=dev-libs/glib-2.32.0
	>=dev-libs/libzip-0.8
	>=dev-libs/check-0.9.4
	usb?  ( virtual/libusb:1 )
	ftdi? ( >=dev-embedded/libftdi-0.16 )
	alsa? ( >=media-libs/alsa-lib-1.0 )
	udev? ( >=virtual/udev-151 )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	cxx? ( app-doc/doxygen sys-devel/autoconf-archive )
	python? ( ${PYTHON_DEPS} dev-lang/swig )"
#	>=dev-util/pkgconfig-0.22

src_prepare() {
	if [ ${PV} = 9999 ]; then
		eautoreconf
	fi
}

src_configure() {
	local myconf=(
		--disable-java
		$(use_enable python python)
		$(use_enable cxx cxx))	
	econf "${myconf[@]}"
}

