#!/usr/bin/env bash
set -e
echo "[*] Installing core packages: git, curl, vim, fish..."

sudo apt update
sudo apt install -y git fish curl vim

if ! grep -q fish <<< "$SHELL"; then
  echo "[*] Changing shell to fish..."
  chsh -s "$(command -v fish)"
else
  echo "[✓] fish is already the default shell"
fi

