TERMUX_PKG_HOMEPAGE="https://gitlab.gnome.org/jpu/cambalache"
TERMUX_PKG_DESCRIPTION="Create GTK 4 user interfaces"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux-user-repository, @lunsokhasovan"
TERMUX_PKG_VERSION=0.97.4
TERMUX_PKG_SRCURL=https://gitlab.gnome.org/jpu/cambalache/-/archive/${TERMUX_PKG_VERSION}/cambalache-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ab14692a1febab75c87170b9b5bb8dd49e9d43fb2687e3614c1976e8cda58ae7
TERMUX_PKG_DEPENDS="glib, gtk3, gtk4, gtksourceview5, json-glib, libadwaita, libhandy, libcairo, libxml2, pygobject, webkit2gtk-4.1, webkitgtk-6.0"
TERMUX_PKG_BUILD_DEPENDS="blueprint-compiler, g-ir-scanner, gettext"
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	if [ "${TERMUX_ON_DEVICE_BUILD}" = false ]; then
		termux_error_exit "This package doesn't support cross-compiling."
	fi

	sed -i 's/import locale/import gettext as locale/g' cambalache/app/cambalache.in
	export PYTHONDONTWRITEBYTECODE=1
	termux_setup_gir
}
