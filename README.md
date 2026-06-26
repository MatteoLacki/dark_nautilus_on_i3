# Dark Nautilus on i3

Reproducible Nautilus styling for an i3/GTK setup:

- launches Nautilus with `Breeze-Dark`
- forces libadwaita to prefer dark mode
- makes the file/content pane pure black
- keeps controls, sidebars, menus, hover states, and selections visible

This is intentionally user-local. It writes only under `~/.config/gtk-*` and
`~/.local/share/applications`.

## Install

```sh
./install.sh
```

The installer backs up every existing target file before modifying it. Backups
are stored next to the original file with a timestamped `.dark-nautilus-on-i3.bak.*`
suffix.

After installation, Nautilus is restarted if it is already running.

## Uninstall

```sh
./uninstall.sh
```

This removes the files installed by this repository and restarts Nautilus.
It does not automatically restore timestamped backups, because there may be
multiple backups from multiple installs.

## Files installed

- `~/.local/share/applications/org.gnome.Nautilus.desktop`
- `~/.config/gtk-4.0/settings.ini`
- `~/.config/gtk-4.0/gtk.css`
- `~/.config/gtk-3.0/settings.ini`
- `~/.config/gtk-3.0/gtk.css`

