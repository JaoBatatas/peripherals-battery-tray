#!/usr/bin/env bash
set -euo pipefail

mkdir -p "$HOME/.local/bin" "$HOME/.config/autostart"

install -m 755 bin/peripherals-battery "$HOME/.local/bin/peripherals-battery"
install -m 755 bin/peripherals-tray "$HOME/.local/bin/peripherals-tray"

sudo install -m 644 udev/60-wireless-peripherals.rules /etc/udev/rules.d/60-wireless-peripherals.rules
sudo udevadm control --reload-rules
sudo udevadm trigger --subsystem-match=input --subsystem-match=hidraw

cat << DESKTOP > "$HOME/.config/autostart/peripherals-tray.desktop"
[Desktop Entry]
Type=Application
Name=Peripherals Battery Monitor
Comment=System tray battery monitor for Redragon King Pro 1K and Logitech G435
Exec=$HOME/.local/bin/peripherals-tray
Icon=battery
Terminal=false
Categories=Utility;
X-KDE-autostart-phase=2
DESKTOP

echo "Installed successfully. Run 'peripherals-tray &' or re-login to start."
