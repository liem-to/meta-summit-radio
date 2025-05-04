#! /bin/bash

dir=$(dirname "${0}")
ver=${1}

# shellcheck disable=SC2034
file="radio-stack-ti-hashes.inc"

# shellcheck source=/dev/null
. "${dir}/calc-common.sh"

files="\
  summit_supplicant/laird/summit_supplicant-src-${ver}.tar.gz \
  backports/laird/summit-backports-${ver}.tar.bz2 \
  lrd-network-manager/src/summit-network-manager-src-${ver}.tar.xz \
"

for i in WW US JP EU CA AU
do
  files="${files} \
    firmware/summit-ti351-${i}-firmware-${ver}.tar.bz2 \
  "
done

for i in x86 x86_64 arm-eabi arm-eabihf aarch64 powerpc64-e5500
do
  files="${files} \
    regTI351/laird/${ver}/regTI351-${i}-${ver}.tar.bz2 \
  "
done
