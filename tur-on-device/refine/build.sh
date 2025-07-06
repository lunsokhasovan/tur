TERMUX_PKG_HOMEPAGE="https://gitlab.gnome.org/TheEvilSkeleton/Refine"
TERMUX_PKG_DESCRIPTION="Tweak various aspects of GNOME"
TERMUX_PKG_LICENSE="GPL-3.0-or-later"
TERMUX_PKG_MAINTAINER="@termux-user-repository"
TERMUX_PKG_VERSION=0.5.10
TERMUX_PKG_SRCURL=https://gitlab.gnome.org/TheEvilSkeleton/Refine/-/archive/${TERMUX_PKG_VERSION}/Refine-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=2ac6137878f09711219233269c60f9a1ee284c91c8c089ae2cb808cb5196d89c
TERMUX_PKG_DEPENDS="glib, gtk4, json-glib, libadwaita, libcairo, libgee"
TERMUX_PKG_BUILD_DEPENDS="blueprint-compiler, g-ir-scanner, gettext"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	if [ "${TERMUX_ON_DEVICE_BUILD}" = false ]; then
		termux_error_exit "This package doesn't support cross-compiling."
	fi

	export PYTHONDONTWRITEBYTECODE=1
	termux_setup_gir
}
