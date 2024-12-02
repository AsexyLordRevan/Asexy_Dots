# Installation Guide

Disclaimer- This installation guide is written for Arch and Arch derivative distributions.
Chances are that these packages and tools are a vailable for your distro, but specific steps might differ.

## 1- Install all required packages
Install Hyprland and the rest of the Hypr Ecosystem (Hyprpaper, Hyprlock, Hypridle), Waybar, Rofi, Kitty, Discord, and Firefox. If you use Arch (or an Arch derivative), you can use Pacman:
  
  `pacman -S waybar rofi kitty mako hyprland hyprpaper hyprlock hypridle discord`

You'll need to install the BetterDiscord installer. With arch, you can get it from the AUR:

  `yay -S betterdiscord-installer`

If you don't use Arch, these packages will most likely be in your libraries

If you're using another notification daemon, such as Dunst, make sure to remove it, as it will cause conflicts with Mako.
## BACKUP YOUR ./CONFIG !!!
Before installing anything make sure to back up the folders for anything you're installing !

You'll need to delete the original folders, so move them to a back up folder or rename them !
## 3a- Manual Install
Clone this repo:

`git clone https://asexylordrevan/asexy_dots/ <install directory>`

Copy each directory to its proper config path:

Hyprland + Hypr Ecosystem: `mv <install directory>/hypr ~/.config/hypr`

Waybar: `mv <install directory>/waybar ~/.config/waybar`

Rofi: `mv <install directory>/rofi ~/.config/rofi`

Kitty: `mv <install directory>/kitty ~/.config/kitty`
Mako : `mv <install directory>/kitty ~/.config/mako`

BetterDiscord: `mv <install directory>/betterdiscord/catppuccin.theme.css ~/.config`
You can also just move the files by hand if you have config files outside of .config.
<br />
<br />

## 4- Colours

To get colours working in the system, you'll need to install the `/colours` directory and symlink it into various directories.

To first install the colours, move the directory to .config:

`mv <install directory>/colours ~/.configc/colours`

This is where the Hypr ecosystem, Waybar, Rofi, and BetterDiscord pull colours from.
<br />
<br />

To get colours to work with Hyprland, Waybar, and BetterDiscord, you'll need to move a part of it into each directory : 

Hyprland: `awk 'NR>=1 && NR<=79' ~/.config/colours/colours.conf > .config/hypr/colours.conf`

Waybar: `awk 'NR>=80 && NR<=107' ~/.config/colours/colours.conf > .config/waybar/colours.css`

BetterDiscord: `awk 'NR>=80 && NR<=107' ~/.config/colours/colours.conf > .config/betterdiscord/themes/colours.css`

Rofi: `awk 'NR>=109 && NR<=140' ~/.config/colours/colours.conf > .config/rofi/colours.rasi`

<br />
<br />

Colours don't currently work for Mako or Kitty

##5- Sync
The `.sync.sh` script will sync your colours, and reload your configurations, across Hyprland, Waybar, Rofi, and BetterDiscord

To install it, just move `.sync.sh` to your home directory : `mv ~/<install directory>/.sync.sh ~/.sync.sh`

If you want, reference it as a command in your bashrc or zshrc. Just append `alias sync="bash .sync.sh"`
