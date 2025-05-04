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
  firmware/${ver}/summit-nx61x-firmware-${ver}.tar.bz2 \
  firmware/${ver}/summit-nx61x-1218-firmware-${ver}.tar.bz2 \
"

calc_hash sha256sum "${files}"
calc_hash md5sum "${files}"
