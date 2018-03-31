BAK="bak"
CRUFT="rucksack-cruft"

function get_link_expr_from_ls() {
  local file="$1"
  ls -l "${file}" | cut -f 12- -d " " 
}

function ln_to() {
  local src="$1"
  local dest="$2"
  ln -s "${src}" "${dest}"
  echo -e "- linked from ${src} to ${dest}"
}

function rm_link() {
  local file="$1"
  if [[ -L "${file}" ]]; then
    local link=$( get_link_expr_from_ls $file )
    rm "${file}"
    echo -e "- removed symlink ${link}"
  fi
}

function cp_to() {
  local src="$1"
  local dest="$2"
  cp "${src}" "${dest}"
  echo -e "- copied from ${src} to ${dest}"
}

function mv_to_bak() {
  local file="$1"
  local file_bak="${file}.${BAK}"

  if [[ -f "${file}" ]]; then
    mv "${file}" "${file_bak}"
    echo -e "- moved ${file} to ${file_bak}"
  fi
}

function mv_from_bak() {
  local file="$1"
  local file_bak="${file}.${BAK}"
  if [[ -f "${file_bak}" ]]; then
    mv "${file_bak}" "${file}"
    echo -e "- moved ${file_bak} to ${file}"
  fi
}

function mv_to_cruft() {
  local file="$1"
  local file_cruft="${file}.${CRUFT}"

  if [[ -f "${file}" ]]; then
    mv "${file}" "${file_cruft}"
    echo -e "- moved ${file} to ${file_cruft}"
  fi
}

function mv_from_cruft() {
  local file="$1"
  local file_cruft="${file}.${CRUFT}"

  if [[ -f "${file_cruft}" ]]; then
    mv "${file_cruft}" "${file}"
    echo -e "- moved ${file_cruft} to ${file}"
  fi
}

function unpack_file() {
  local rucksack_file="$1"
  local dest_file="$2"

  mv_to_bak "${dest_file}"
  mv_from_cruft "${dest_file}"
  if [[ ! -f "${dest_file}" ]]; then
    cp_to "${rucksack_file}" "${dest_file}"
  fi
}
