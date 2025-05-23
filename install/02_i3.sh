#!/usr/bin/env bash
set -e

is_wsl() {
  grep -qiE 'microsoft|wsl' /proc/version
}

is_headless() {
  ! command -v startx >/dev/null
}

echo "[*] Checking system compatibility for i3..."

if is_wsl; then
  echo "[!] Detected WSL. X11/i3 is not supported here."
  exit 1
fi

if is_headless; then
  echo "[*] X11 is not installed."
  read -p "Install minimal X11 + i3 stack? [y/N]: " install_choice
  if [[ "$install_choice" =~ ^[Yy]$ ]]; then
    sudo apt install -y xorg xinit xterm i3 lightdm
  else
    echo "[!] Skipping i3 setup."
    exit 0
  fi
else
  echo "[✓] X11 environment detected"
fi

echo "[*] Installing i3 config..."



