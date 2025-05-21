require radio-firmware.inc 
require radio-stack-version.inc

LICENSE += "& NXP2"
NO_GENERIC_LICENSE[NXP2] = "LICENSE.nxp2"
LIC_FILES_CHKSUM += "file://LICENSE.nxp2;md5=7b112d07b0616149941639c05f68f431"

FILES:${PN} += "${sysconfdir}"

SONA_NX_PKG_PREFIX ?= ""

do_install:append() {
    install -d  "${D}${sysconfdir}/modprobe.d"
    if [ -n "${SONA_NX_PKG_PREFIX}" ]; then
        echo "options moal mod_para=nxp/${SONA_NX_PKG_PREFIX}_wifi_mod_params.conf" > "${D}${sysconfdir}/modprobe.d/moal.conf"
    else 
        echo "options moal mod_para=nxp/wifi_mod_params.conf" > "${D}${sysconfdir}/modprobe.d/moal.conf"
    fi
}
