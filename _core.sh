#!/usr/bin/env bash

BAK="bak"
CRUFT="rucksack-cruft"
STATE_DIR="${HOME}/.rucksack"
POCKETS_DIR="${STATE_DIR}/pockets"
LOG_FILE="${STATE_DIR}/activity.log"
BREW_FORMULA_INSTALLED_FILE="brew-formula-installed.txt"

# Exit on first error.  Beware: http://mywiki.wooledge.org/BashFAQ/105
set -e

function assert_brew_installed() {
  log "verifying brew (and brew cask) are installed..."
  which brew >/dev/null 2>&1
  local is_brew_installed=$?
  if [[ is_brew_installed -eq 0 ]]; then
    brew tap | grep "caskroom/cask" >/dev/null 2>&1
    local is_cask_tapped=$?
    if [[ is_cask_tapped -ne 0 ]]; then
      log "rucksack requires the 'cask' Homebrew tap.  Please install that tap: https://caskroom.github.io/"
      exit 1
    fi
  else
    log "rucksack requires Homebrew.  Please install brew: https://brew.sh/"
    exit 1
  fi
}

function init_state() {
  mkdir -p "${STATE_DIR}"
  mkdir -p "${POCKETS_DIR}"
  touch "${LOG_FILE}"

  assert_brew_installed
}

function log() {
  local now="$( date "+%Y-%m-%d @ %H:%M:%S" )"
  echo -e "${now} : $1" >> ${LOG_FILE}
  echo -e "$1"
}

function get_link_expr_from_ls() {
  local file="$1"
  ls -l "${file}" | cut -f 13- -d " "
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

  if [[ -d "${POCKETS_DIR}/${pocket}" ]]; then echo -n "true"; else echo -n "false"; fi
}

function add_to_installed_pockets_list() {
  mkdir "${POCKETS_DIR}/${POCKET}"
  touch "${POCKETS_DIR}/${POCKET}/${BREW_FORMULA_INSTALLED_FILE}"
}

function remove_from_installed_pockets_list() {
  rm -rf "${POCKETS_DIR}/${POCKET}"
}

function abort_if_pocket_installed {
  if [[ $(is_pocket_installed ${POCKET}) == "true" ]]; then
    log "'${POCKET}' is already installed; skipping installation."
    exit 0
  fi
}

function abort_if_pocket_not_installed {
  if [[ $(is_pocket_installed ${POCKET}) == "false" ]]; then
    log "'${POCKET}' is not installed; skipping uninstall."
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

  grep --no-filename "^${formula}$" "${POCKETS_DIR}"/*/"${BREW_FORMULA_INSTALLED_FILE}" >/dev/null
  if [[ $? -eq 0 ]]; then echo -n "true"; else echo -n "false"; fi
}

function add_to_installed_by_rucksack_list() {
  local formula="$1"

  echo "${formula}" >> "${POCKETS_DIR}/${POCKET}/${BREW_FORMULA_INSTALLED_FILE}"
}

function remove_from_installed_by_rucksack_list() {
  local formula="$1"

  sed -i '.bak' "/^${formula}$/d" "${POCKETS_DIR}/${POCKET}/${BREW_FORMULA_INSTALLED_FILE}"
}

function brew_install() {
  local formula="$1"

  if [[ $( was_installed_by_rucksack ${formula} ) == "true" ]]; then
    add_to_installed_by_rucksack_list "${formula}"
  else
    if [[ $( is_brew_installed ${formula} ) == "true" ]]; then
      log "- ${formula} is already brew-installed; skipping install."
    else
      log "- brew-installing ${formula}"
      brew install ${formula} >>"${LOG_FILE}" 2>&1
      add_to_installed_by_rucksack_list "${formula}"
    fi
  fi
}

function brew_uninstall() {
  local formula="$1"

  if [[ $( is_brew_installed ${formula} ) == "true" ]]; then
    if [[ $( was_installed_by_rucksack ${formula} ) == "true" ]]; then
      remove_from_installed_by_rucksack_list "${formula}"
      if [[ $( was_installed_by_rucksack ${formula} ) == "false" ]]; then
        log "- brew-uninstalling ${formula}"
        brew uninstall ${formula} >>"${LOG_FILE}" 2>&1 
      else
        log "- ${formula} is brew-installed, but it is also required by other pockets; skipping uninstall."
      fi
    else
      log "- ${formula} is brew-installed, but it was not installed by rucksack; skipping uninstall."
    fi
  else
    log "- ${formula} is not brew-installed; skipping uninstall."
  fi
}


function brew_cask_install() {
  local formula="$1"

  if [[ $( was_installed_by_rucksack ${formula} ) == "true" ]]; then
    add_to_installed_by_rucksack_list "${formula}"
  else
    if [[ $( is_brew_installed ${formula} ) == "true" ]]; then
      log "- ${formula} is already brew-installed; skipping install."
    else
      log "- brew-installing ${formula}"
      # handle user input?
      brew cask install ${formula} >>"${LOG_FILE}" 2>&1
      add_to_installed_by_rucksack_list "${formula}"
    fi
  fi
}

function brew_cask_uninstall() {
  local formula="$1"

  if [[ $( is_brew_installed ${formula} ) == "true" ]]; then
    if [[ $( was_installed_by_rucksack ${formula} ) == "true" ]]; then
      remove_from_installed_by_rucksack_list "${formula}"
      if [[ $( was_installed_by_rucksack ${formula} ) == "true" ]]; then
        log "- brew-uninstalling ${formula}"
        brew cask uninstall ${formula} >>"${LOG_FILE}" 2>&1
      else
        log "- ${formula} is brew-installed, but it is also required by other pockets; skipping uninstall."
      fi
    else
      log "- ${formula} is brew-installed, but it was not installed by rucksack; skipping uninstall."
    fi
  else
    log "- ${formula} is not brew-installed; skipping uninstall."
  fi
}
