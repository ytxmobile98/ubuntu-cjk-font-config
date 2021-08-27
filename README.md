# Ubuntu CJK font configuration files (per user)

This repository contains the configuration for CJK fonts.

* To set the configuration for each user, copy the `conf.d` directory into the per-user config file directory: `~/.config/fontconfig/`.
* See `man fonts-conf.5` for more details.

## Scripts to execute (using Bash)
* `install.sh`: copies the `conf.d` directory to `~/.config/fontconfig/`.
* `uninstall.sh`: removes the `*.conf` files in the `~/.config/fontconfig/conf.d` directory, and then cleans up (removes) `~/.config/fontconfig/conf.d` and `~/.config/fontconfig/` directories if they are empty.