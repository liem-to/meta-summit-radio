SUMMARY = "Summit Wi-Fi MSD50 & WB50n Manufacturing tools"

REG_NAME = "reg50n"

require mfg-reg.inc
require radio-stack-msd-version.inc

INSTALL_TOOLS += "${B}/smu_cli" "${B}/tcmd.sh"

do_install_append () {
    install -D -m 644 -t "${D}${nonarch_base_libdir}/firmware/ath6k/AR6004/hw3.0/" \
        "${B}"/utf*.bin
}
