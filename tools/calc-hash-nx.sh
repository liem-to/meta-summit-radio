#! /bin/bash

dir=$(dirname "${0}")
ver=${1}

# shellcheck disable=SC2034
file="radio-stack-nx-hashes.inc"

# shellcheck source=/dev/null
. "${dir}/calc-common.sh"

files="\
  summit_supplicant/laird/${ver}/summit_supplicant-src-${ver}.tar.gz \
  backports/laird/${ver}/summit-backports-${ver}.tar.bz2 \
  lrd-network-manager/src/${ver}/summit-network-manager-src-${ver}.tar.xz \
  firmware/${ver}/summit-nx61x-firmware-${ver}.tar.bz2 \
  firmware/${ver}/summit-nx61x-1218-firmware-${ver}.tar.bz2 \
"

for i in x86 x86_64 arm-eabi arm-eabihf aarch64 powerpc64-e5500
do
  files="${files} mfg611/laird/${ver}/mfg611-${i}-${ver}.tar.bz2"
done

calc_hash sha256sum "${files}"
calc_hash md5sum "${files}"
