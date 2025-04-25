#! /bin/sh

set -e

dir=$(dirname "${0}")

tmpdir="$(mktemp -d -t calc-hash-XXXXXX)"
export tmpdir

for i in 60 lwb msd mt nx ti bdsdmac
do
  "${dir}/calc-hash-${i}.sh" "${1}" &
  pids="${pids} $!"
done

success=true
for i in ${pids}; do
  wait "${i}" || success=false
done

rm -rf "${tmpdir}"

${success} || exit 1
