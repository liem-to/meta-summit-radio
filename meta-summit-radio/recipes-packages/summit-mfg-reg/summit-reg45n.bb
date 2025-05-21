SUMMARY = "Summit Wi-Fi MSD45 & WB45n Manufacturing tools"

REG_NAME = "reg45n"

require mfg-reg.inc
require radio-stack-version.inc

INSTALL_TOOLS += "${B}/smu_cli" "${B}/tcmd.sh"

do_install:append () {
    install -D -m 644 -t "${D}${nonarch_base_libdir}/firmware/ath6k/AR6003/hw2.1.1" \
        "${B}"/utf*.bin
}
