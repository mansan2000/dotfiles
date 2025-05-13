#!/usr/bin/env bash
set -e

echo "[*] Symlinking dotfiles into home directory..."

link() {
  local src=$1
  local dest=$2

  if [[ -e "$dest" && ! -L "$dest" ]]; then
    echo "[!] Backing up $dest to $dest.bak"
    sudo mv "$dest" "$dest.bak"
  fi

  mkdir -p "$(dirname "$dest")"
  sudo ln -sf "$src" "$dest"
  echo "[✓] Linked $dest → $src"
}

# Examples — add more as needed
link "$HOME/dotfiles/.config/fish/config.fish" "$HOME/.config/fish/config.fish"
link "$HOME/dotfiles/.config/i3/config" "$HOME/.config/i3/config"
link "$HOME/dotfiles/.xinitrc" "$HOME/.xinitrc"
link "$HOME/dotfiles/keyd/default-internal.conf" "/etc/keyd/default.conf"

