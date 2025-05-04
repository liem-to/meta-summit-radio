#! /bin/bash

dir=$(dirname "${0}")
ver=${1}

# shellcheck disable=SC2034
file="radio-stack-msd-hashes.inc"

# shellcheck source=/dev/null
. "${dir}/calc-common.sh"

files="\
  summit_supplicant/laird/${ver}/summit_supplicant-src-${ver}.tar.gz \
  backports/laird/${ver}/summit-backports-${ver}.tar.bz2 \
  firmware/${ver}/summit-ath6k-6003-firmware-${ver}.tar.bz2 \
  firmware/${ver}/summit-ath6k-6004-firmware-${ver}.tar.bz2 \
"

for i in arm-eabi arm-eabihf
do
  files="${files} \
    summit_supplicant/laird/${ver}/summit_supplicant_libs_legacy-${i}-${ver}.tar.bz2 \
    reg45n/laird/${ver}/reg45n-${i}-${ver}.tar.bz2 \
    reg50n/laird/${ver}/reg50n-${i}-${ver}.tar.bz2 \
    "
done

calc_hash sha256sum "${files}"
calc_hash md5sum "${files}"
