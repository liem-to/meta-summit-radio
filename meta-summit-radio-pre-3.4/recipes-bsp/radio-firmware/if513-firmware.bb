SUMMARY = "Summit firmware for the IF513 SDIO/UART modules"

SUMMARY_if513-sdio-div-firmware = "Summit firmware for the IF513 SDIO/UART module with diversity antenna"
SUMMARY_if513-sdio-sa-firmware = "Summit firmware for the IF513 SDIO/UART module with single antenna"

require radio-firmware-lwb.inc
inherit update-alternatives

SRC_URI = "\
    ${SUMMIT_URI}/summit-if513-sdio-div-firmware-${PV}.tar.bz2;name=if513-sdio-div-firmware  \
    ${SUMMIT_URI}/summit-if513-sdio-sa-firmware-${PV}.tar.bz2;name=if513-sdio-sa-firmware  \
    "

do_install_append() {
    # Remove the generic firmware files that are not used by LWB5+
    rm -f "${D}${nonarch_base_libdir}/firmware/cypress/cyfmac55500-sdio.txt"
}

PACKAGES =+ " \
    ${PN}-sdio-fw \
    if513-sdio-div-firmware \
    if513-sdio-sa-firmware \
    "

# Internal packages
FILES_${PN} = ""

# User facing packages
FILES_${PN}-sdio-fw = "\
    ${nonarch_base_libdir}/firmware/cypress/cyfmac55500-if513_*.clm_blob \
    ${nonarch_base_libdir}/firmware/cypress/cyfmac55500-sdio.clm_blob \
    ${nonarch_base_libdir}/firmware/cypress/cyfmac55500-sdio.trxse \
    ${nonarch_base_libdir}/firmware/cypress/cyfmac55500-sdio-prod_*.trxse \
    ${nonarch_base_libdir}/firmware/cypress/CYW55500A1_*.hcd \
    ${nonarch_base_libdir}/firmware/brcm/CYW55500A1.hcd \
    "

FILES_if513-sdio-div-firmware = "\
    ${nonarch_base_libdir}/firmware/cypress/cyfmac55500-if513-div.txt \
    "

FILES_if513-sdio-sa-firmware = "\
    ${nonarch_base_libdir}/firmware/cypress/cyfmac55500-if513-sa.txt \
    "

RDEPENDS_if513-sdio-div-firmware += "\
    ${PN}-sdio-fw \
    ${@'lwb-if-regdomain' if d.getVar('LWB_REGDOMAIN') else ''} \
    "

RDEPENDS_if513-sdio-sa-firmware += "\
    ${PN}-sdio-fw \
    ${@'lwb-if-regdomain' if d.getVar('LWB_REGDOMAIN') else ''} \
    "

ALTERNATIVE_if513-sdio-div-firmware = "if513-nvram"
ALTERNATIVE_if513-sdio-sa-firmware = "if513-nvram"

ALTERNATIVE_LINK_NAME[if513-nvram] = "${nonarch_base_libdir}/firmware/cypress/cyfmac55500-sdio.txt"

ALTERNATIVE_PRIORITY_if513-sdio-div-firmware[if513-nvram] = "100"
ALTERNATIVE_PRIORITY_if513-sdio-sa-firmware[if513-nvram] = "90"

ALTERNATIVE_TARGET_if513-sdio-div-firmware[if513-nvram] = "${nonarch_base_libdir}/firmware/cypress/cyfmac55500-if513-div.txt"
ALTERNATIVE_TARGET_if513-sdio-sa-firmware[if513-nvram] = "${nonarch_base_libdir}/firmware/cypress/cyfmac55500-if513-sa.txt"
