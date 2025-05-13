#!/bin/bash

LOG=~/keyd-keyboard-toggle.log
echo "$(date): checking keyboard state..." >> "$LOG"

if lsusb | grep -qi "29ea:0102"; then
  echo "$(date): Kinesis keyboard detected — using external layout" >> "$LOG"
  sudo ln -sf ~/dotfiles/keyd/default-external.conf /etc/keyd/default.conf
else
  echo "$(date): Kinesis keyboard not detected — using internal layout" >> "$LOG"
  sudo ln -sf ~/dotfiles/keyd/default-internal.conf /etc/keyd/default.conf
fi

sudo systemctl restart keyd
echo "$(date): keyd restarted" >> "$LOG"

