#! /bin/bash

dir=$(dirname "${0}")
ver=${1}

# shellcheck disable=SC2034
file="radio-stack-lwb-hashes.inc"

# shellcheck source=/dev/null
. "${dir}/calc-common.sh"

files="\
  summit_supplicant/laird/${ver}/summit_supplicant-src-${ver}.tar.gz \
  lrd-network-manager/src/${ver}/summit-network-manager-src-${ver}.tar.xz \
  backports/laird/${ver}/summit-backports-${ver}.tar.bz2 \
  firmware/${ver}/summit-lwb-firmware-${ver}.tar.bz2 \
  firmware/${ver}/summit-lwbplus-firmware-${ver}.tar.bz2 \
"
for i in sdio-div sdio-sa sdio-sa-m2 usb-div usb-sa usb-sa-m2
do
  files="${files} firmware/${ver}/summit-lwb5plus-${i}-firmware-${ver}.tar.bz2"
done
for i in sdio pcie
do
  files="${files} firmware/${ver}/summit-if573-${i}-firmware-${ver}.tar.bz2"
done
for i in sdio-div sdio-sa
do
  files="${files} firmware/${ver}/summit-if513-${i}-firmware-${ver}.tar.bz2"
done

for i in arm-eabi arm-eabihf aarch64
do
  files="${files} regCypress/laird/${ver}/regCypress-${i}-${ver}.tar.bz2"
done

for i in x86 x86_64 arm-eabi arm-eabihf aarch64 powerpc64-e5500
do
  files="${files} \
    regLWB5plus/laird/${ver}/regLWB5plus-${i}-${ver}.tar.bz2 \
    regLWBplus/laird/${ver}/regLWBplus-${i}-${ver}.tar.bz2 \
    regIF573/laird/${ver}/regIF573-${i}-${ver}.tar.bz2 \
    regIF513/laird/${ver}/regIF513-${i}-${ver}.tar.bz2 \
  "
done

calc_hash sha256sum "${files}"
calc_hash md5sum "${files}"
