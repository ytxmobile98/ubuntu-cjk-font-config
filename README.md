# Ubuntu CJK font configuration files (per user)

This repository contains the configuration for CJK fonts.

## Install configurations
```shell
bash install.sh
```
* Copies the `conf.d` directory to `~/.config/fontconfig/`.

## Uninstall configurations
```shell
bash uninstall.sh
```
* Removes the `*.conf` files in the `~/.config/fontconfig/conf.d` directory.
* Cleans up (removes) the `~/.config/fontconfig/conf.d` and `~/.config/fontconfig/` directories if they are empty.

# References
* Ubuntu manpage: `man fonts-conf.5`