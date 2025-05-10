require mfg-reg.inc
require radio-stack-lwb-version.inc

LIC_FILES_CHKSUM += "file://FOSS_README.txt;md5=02c65bdd6b6f7dac25fea2a4a2d18c51"

do_install_append() {
	find "${B}" -name "brcfmac*" -exec install -D -m 644 \
		-t "${D}${nonarch_base_libdir}/firmware/brcfmac" {} +
	find "${B}" -name "cyfmac*"  -exec install -D -m 644 \
		-t "${D}${nonarch_base_libdir}/firmware/cyfmac"  {} +
}
