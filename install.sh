#!/usr/bin/env bash
set -euo pipefail

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
timestamp=$(date +%Y%m%d-%H%M%S)

backup_if_exists() {
  target=$1
  if [ -e "$target" ]; then
    cp "$target" "$target.betternautilus.bak.$timestamp"
  fi
}

install_file() {
  source=$1
  target=$2
  mkdir -p "$(dirname -- "$target")"
  backup_if_exists "$target"
  cp "$source" "$target"
}

install_file "$repo_dir/config/applications/org.gnome.Nautilus.desktop" \
  "$HOME/.local/share/applications/org.gnome.Nautilus.desktop"
install_file "$repo_dir/config/gtk-4.0/settings.ini" \
  "$HOME/.config/gtk-4.0/settings.ini"
install_file "$repo_dir/config/gtk-4.0/gtk.css" \
  "$HOME/.config/gtk-4.0/gtk.css"
install_file "$repo_dir/config/gtk-3.0/settings.ini" \
  "$HOME/.config/gtk-3.0/settings.ini"
install_file "$repo_dir/config/gtk-3.0/gtk.css" \
  "$HOME/.config/gtk-3.0/gtk.css"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true
fi

if pgrep -x nautilus >/dev/null 2>&1; then
  nautilus -q >/dev/null 2>&1 || true
fi

echo "betternautilus installed."
echo "Open Files/Nautilus again to use the new styling."

