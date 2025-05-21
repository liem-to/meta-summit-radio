SUMMARY = "Summit Wi-Fi 60 Manufacturing tools"

REG_NAME = "mfg60n"

require mfg-reg.inc
require radio-stack-version.inc

do_install:append() {
    install -D -m 644 -t "${D}${nonarch_base_libdir}/firmware/lrdmwl" \
        "${B}/88W8997_mfg_"*
}
