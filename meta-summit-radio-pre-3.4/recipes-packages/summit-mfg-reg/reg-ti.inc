require mfg-reg.inc
radio-stack-ti-version.inc

do_install() {
	install -D -t "${D}${bindir}" -m 775 "${B}/lru"

	if ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'true', 'false', d)} && [ -f "${B}/btlru" ]; then
		install -D -t "${D}${bindir}" -m 775 "${B}/btlru"
	fi

	install -D -t "${D}${nonarch_base_libdir}/firmware/ti-connectivity" -m 644 "${B}/ti351-conf"*
}
