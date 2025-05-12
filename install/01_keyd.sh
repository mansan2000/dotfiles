#!/usr/bin/env bash
set -e
echo "[*] Installing keyd..."

sudo apt install -y build-essential git make
git clone https://github.com/rvaiya/keyd /tmp/keyd || true
cd /tmp/keyd
make && sudo make install

echo "[*] Deploying keyd config..."
sudo mkdir -p /etc/keyd
sudo cp ~/dotfiles/keyd/default.conf /etc/keyd/default.conf

sudo systemctl enable keyd
sudo systemctl restart keyd

