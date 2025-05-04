#! /bin/bash

dir=$(dirname "${0}")
ver=${1}

# shellcheck disable=SC2034
file="radio-stack-60-hashes.inc"

# shellcheck source=/dev/null
. "${dir}/calc-common.sh"

files="\
  summit_supplicant/laird/${ver}/summit_supplicant-src-${ver}.tar.gz \
  backports/laird/${ver}/summit-backports-${ver}.tar.bz2 \
  adaptive_bt/src/${ver}/adaptive_bt-src-${ver}.tar.gz \
  lrd-network-manager/src/${ver}/summit-network-manager-src-${ver}.tar.xz \
  firmware/${ver}/summit-som8mp-radio-firmware-${ver}.tar.bz2 \
"

for i in x86 x86_64 arm-eabi arm-eabihf aarch64 powerpc64-e5500
do
  files="${files} \
    adaptive_ww/laird/${ver}/adaptive_ww-${i}-${ver}.tar.bz2 \
    summit_supplicant/laird/${ver}/summit_supplicant_libs-${i}-${ver}.tar.bz2 \
    mfg60n/laird/${ver}/mfg60n-${i}-${ver}.tar.bz2 \
  "
done

for i in pcie-uart pcie-usb sdio-uart sdio-sdio usb-usb usb-uart
do
  files="${files} firmware/${ver}/summit-60-radio-firmware-${i}-${ver}.tar.bz2"
done

calc_hash sha256sum "${files}"
calc_hash md5sum "${files}"
