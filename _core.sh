BAK="bak"
CRUFT="rucksack-cruft"
STATE_DIR="${HOME}/.rucksack"
LOG_FILE="${STATE_DIR}/install.log"
INSTALLED_BREW_FORMULA_FILE="${STATE_DIR}/brew-formula-installed-by-rucksack.txt"
INSTALLED_POCKETS_FILE="${STATE_DIR}/pockets-installed.txt"

# Exit on first error.  Beware: http://mywiki.wooledge.org/BashFAQ/105
set -e

function init_state() {
  mkdir -p "${STATE_DIR}"
  touch "${LOG_FILE}"
  touch "${INSTALLED_BREW_FORMULA_FILE}"
  touch "${INSTALLED_POCKETS_FILE}"
}

function log() {
  local now="$( date "+%Y-%m-%d@%H:%M:%S" )"
  echo -e "${now} -- $1" >> ${LOG_FILE}
  echo -e "$1"
}

function get_link_expr_from_ls() {
  local file="$1"
  ls -l "${file}" | cut -f 12- -d " " 
}

function ln_to() {
  local src="$1"
  local dest="$2"
  ln -s "${src}" "${dest}"
  log "- linked from ${src} to ${dest}"
}

function rm_link() {
  local file="$1"
  if [[ -L "${file}" ]]; then
    local link=$( get_link_expr_from_ls $file )
    rm "${file}"
    log "- removed symlink ${link}"
  fi
}

function cp_to() {
  local src="$1"
  local dest="$2"
  cp "${src}" "${dest}"
  log "- copied from ${src} to ${dest}"
}

function mv_to_bak() {
  local file="$1"
  local file_bak="${file}.${BAK}"

  if [[ -f "${file}" ]]; then
    mv "${file}" "${file_bak}"
    log "- moved ${file} to ${file_bak}"
  fi
}

function mv_from_bak() {
  local file="$1"
  local file_bak="${file}.${BAK}"
  if [[ -f "${file_bak}" ]]; then
    mv "${file_bak}" "${file}"
    log "- moved ${file_bak} to ${file}"
  fi
}

function mv_to_cruft() {
  local file="$1"
  local file_cruft="${file}.${CRUFT}"

  if [[ -f "${file}" ]]; then
    mv "${file}" "${file_cruft}"
    log "- moved ${file} to ${file_cruft}"
  fi
}

function mv_from_cruft() {
  local file="$1"
  local file_cruft="${file}.${CRUFT}"

  if [[ -f "${file_cruft}" ]]; then
    mv "${file_cruft}" "${file}"
    log "- moved ${file_cruft} to ${file}"
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

function is_pocket_installed() {
  local pocket="$1"

  grep "^${pocket}$" "${INSTALLED_POCKETS_FILE}" >/dev/null
  if [[ $? -eq 0 ]]; then echo -n "true"; else echo -n "false"; fi
}

function add_to_installed_pockets_list() {
  local pocket="$1"

  log "${pocket}" >> "${INSTALLED_POCKETS_FILE}"
}

function remove_from_installed_pockets_list() {
  local pocket="$1"

  sed -i '.bak' "/^${pocket}$/d" "${INSTALLED_POCKETS_FILE}"
}

function abort_if_pocket_installed {
  local pocket="$1"

  if [[ $(is_pocket_installed ${pocket}) == "true" ]]; then
    log "'${pocket}' is already installed; skipping installation."
    exit 0
  fi
}

function abort_if_pocket_not_installed {
  local pocket="$1"

  if [[ $(is_pocket_installed ${pocket}) == "false" ]]; then
    log "'${pocket}' is not installed; skipping uninstallation."
    exit 0
  fi
}

function is_brew_installed() {
  local formula="$1"

  brew list --versions ${formula} >/dev/null 
  if [[ $? -eq 0 ]]; then echo -n "true"; else echo -n "false"; fi
}

function was_installed_by_rucksack() {
  local formula="$1"

  grep "^${formula}$" "${INSTALLED_BREW_FORMULA_FILE}" >/dev/null
  if [[ $? -eq 0 ]]; then echo -n "true"; else echo -n "false"; fi
}

function brew_install() {
  local formula="$1"

  if [[ $( is_brew_installed ${formula} ) == "true" ]]; then
    log "- ${formula} is brew-installed; skipping install."
  else
    log "- brew-installing ${formula}"
    brew install ${formula} >>"${LOG_FILE}" 2>&1
    log "${formula}" >> "${INSTALLED_BREW_FORMULA_FILE}"
  fi
}

function brew_uninstall() {
  local formula="$1"

  if [[ $( is_brew_installed ${formula} ) == "true" ]]; then
    if [[ $( was_installed_by_rucksack ${formula} ) == "true" ]]; then
      log "- brew-uninstalling ${formula}"
      brew uninstall ${formula} >>"${LOG_FILE}" 2>&1 
      sed -i '.bak' "/^${formula}$/d" "${INSTALLED_BREW_FORMULA_FILE}"
    else
      log "- ${formula} is brew-installed, but it was not installed by rucksack; skipping uninstall."
    fi
  else
    log "- ${formula} is not brew-installed; skipping uninstall."
  fi
}
