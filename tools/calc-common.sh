#! /bin/sh

: "${file:-?}"

[ -z "${ver}" ] && { echo "Usage: ${0} <version>"; exit 1; }

prefix="/var/www/html/builds/linux"
cmd="ssh -o ControlMaster=auto fileshare@files.devops.rfpros.com"

calc_file () {
  md5="$(${cmd} "md5sum ${prefix}/${1}/${ver}/${2}")"
  sha256="$(${cmd} "sha256sum ${prefix}/${1}/${ver}/${2}")"

  echo "SRC_URI[${3}.md5sum] = \"${md5%% *}\""
  echo "SRC_URI[${3}.sha256sum] = \"${sha256%% *}\""
} >> "${file}"

printf 'RADIO_VERSION = "%s"\n\n' "${ver}" > "${file}"
