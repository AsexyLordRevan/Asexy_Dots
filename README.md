# Dotfiles
Dotfiles for an Arch based Hyprland setup.

Includes Hyprland, Waybar, and Rofi. These are mandatory

There are also config files for BetterDiscord, Firefox, and Kitty.


Most of these (Hyprland, Waybar, Rofi and Firefox) source one of three colour files, located in .config/colours/.

These files are synced into various directories. More instructions are located in Install.md

The .sync.sh script will sync colours across everything, and can be used as a command with an alias, just add this line to your .zshrc (or .bashrc)

`alias sync="~/.sync.sh"`

Be warned as it will kill and restart waybar, so make sure that your config files work before running it.

_____
These are continuously updated, so themes, packages, and modules/plugins can and will change.
