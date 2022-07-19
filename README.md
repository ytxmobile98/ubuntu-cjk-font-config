# Ubuntu CJK font configuration files (per user)

This repository contains the configuration for CJK fonts.

## Install configurations
```bash
make install
```
* Copies the `conf.d` directory to `~/.config/fontconfig/`.

After installing the font configurations, **log out of your user session and then log in again** to let the changes take effect.

## Uninstall configurations
```bash
make uninstall
```
* Removes the `*.conf` files in the `~/.config/fontconfig/conf.d` directory.
* Cleans up (removes) the `~/.config/fontconfig/conf.d` and `~/.config/fontconfig/` directories if they are empty.

After uninstalling the font configurations, **log out of your user session and then log in again** to let the changes take effect.

# References
* Ubuntu manpage: `man fonts-conf.5`