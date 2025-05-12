#!/usr/bin/env bash
set -e

info() { echo -e "[\033[1;34mINFO\033[0m] $1"; }
warn() { echo -e "[\033[1;33mWARN\033[0m] $1"; }
err()  { echo -e "[\033[1;31mERR\033[0m] $1"; }

MODE="interactive"
[[ "$1" == "--minimal" ]] && MODE="minimal"
[[ "$1" == "--full" ]] && MODE="full"
[[ -n "$1" && "$MODE" == "interactive" ]] && {
  echo "Usage: $0 [--minimal | --full]"
  exit 1
}

info "Starting dotfiles setup in '$MODE' mode..."

run_stage() {
  local script=$1
  if [[ -x "$script" ]]; then
    "$script"
  else
    warn "$script not found or not executable"
  fi
}

run_stage install/00_core.sh

if [[ "$MODE" == "full" ]]; then
  run_stage install/01_keyd.sh
  run_stage install/02_i3.sh
elif [[ "$MODE" == "interactive" ]]; then
  read -p "Install keyd? [y/N]: " keyd_choice
  [[ "$keyd_choice" =~ ^[Yy]$ ]] && run_stage install/01_keyd.sh

  read -p "Install i3 window manager? [y/N]: " i3_choice
  [[ "$i3_choice" =~ ^[Yy]$ ]] && run_stage install/02_i3.sh
fi

info "Done. You may want to log out or reboot if you changed your shell."

