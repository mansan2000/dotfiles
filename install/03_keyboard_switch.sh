#!/usr/bin/env bash
set -e

echo "[*] Installing keyd keyboard-switch script..."

SRC=~/dotfiles/scripts/keyd-keyboard-toggle.sh
DEST=~/scripts/keyd-keyboard-toggle.sh

mkdir -p ~/scripts
cp "$SRC" "$DEST"
chmod +x "$DEST"

echo "[*] Reminder: Add this to your sudoers file via visudo:"
echo "$(whoami) ALL=(ALL) NOPASSWD: /usr/bin/ln, /usr/bin/systemctl"

