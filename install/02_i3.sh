#!/usr/bin/env bash
set -e
echo "[*] Installing i3..."

sudo apt install -y i3 xinit xterm

echo "[*] Setting up .xinitrc"
cp ~/dotfiles/.xinitrc ~/.xinitrc

