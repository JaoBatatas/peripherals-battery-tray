# Peripherals Battery Tray

Lightweight CLI and monochrome KDE Plasma / Wayland system tray battery monitor for:
- **Redragon King Pro 1K** (`3554:f5d5` 2.4GHz dongle & `3554:f55e` wired USB)
- **Logitech G435 Lightspeed** (`046d:0acb`)

## Features
- **Direct HID polling** for Redragon King Pro 1K (battery %, voltage in mV, charging state).
- **Audio-safe polling** for Logitech G435 via `g435-tray --once`: only polls automatically after 60s of audio/microphone inactivity so playback is never interrupted; falls back to cached values while audio is active.
- **Zero-CPU wake detection** (`select()` on `evdev`) to refresh mouse battery immediately when woken from sleep.
- **CLI & Waybar JSON support** (`peripherals-battery --json` / `--watch 5`).

## Dependencies (Arch / CachyOS)

Official repositories:
```bash
sudo pacman -S python python-hidapi python-pyqt6
```

AUR (choose your preferred AUR helper):
```bash
paru -S logitech-g435-battery-bin
# or
yay -S logitech-g435-battery-bin
```

## Installation
```bash
git clone https://github.com/jaobatatas/peripherals-battery-tray.git
cd peripherals-battery-tray
./install.sh
```

## Usage
- **System Tray:** Starts automatically on login (`peripherals-tray`). Left-click an icon to force an immediate refresh; right-click for menu options.
- **Terminal:**
  ```bash
  peripherals-battery
  peripherals-battery --watch 5
  peripherals-battery --json
  ```