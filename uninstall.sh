#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/share/applications/org.gnome.Nautilus.desktop"
rm -f "$HOME/.config/gtk-4.0/settings.ini"
rm -f "$HOME/.config/gtk-4.0/gtk.css"
rm -f "$HOME/.config/gtk-3.0/settings.ini"
rm -f "$HOME/.config/gtk-3.0/gtk.css"

if command -v update-desktop-database >/dev/null 2>&1; then
  update-desktop-database "$HOME/.local/share/applications" >/dev/null 2>&1 || true
fi

if pgrep -x nautilus >/dev/null 2>&1; then
  nautilus -q >/dev/null 2>&1 || true
fi

echo "betternautilus removed."
echo "Restore one of the .betternautilus.bak.* files manually if needed."

