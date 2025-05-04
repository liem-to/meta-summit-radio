#! /bin/sh

set -e

dir=$(dirname "${0}")

for i in 60 lwb msd mt nx ti bdsdmac
do
  "${dir}/calc-hash-${i}.sh" "${1}"
done
