SUMMARY = "Summit Wi-Fi Regulatory Test tools for TI351"

REG_NAME = "regTI351"

require mfg-reg.inc
require radio-stack-version.inc

do_install:append() {
    install -D -m 644 -t "${D}${nonarch_base_libdir}/firmware/ti-connectivity" \
        "${B}/ti351-conf"*
}
