# Installation Guide

Disclaimer- This installation guide is written for Arch and Arch derivative distributions.
Chances are that these packages and tools are a vailable for your distro, but specific steps might differ.

## 1- Install all required packages
Install Hyprland and the rest of the Hypr Ecosystem (Hyprpaper, Hyprlock, Hypridle), Waybar, Rofi, Kitty, Discord, and Firefox with pacman:

  `pacman -S waybar rofi kitty firefox hyprland hyprpaper hyprlock hypridle discord`

You'll need to install the BetterDiscord installer from the AUR:

  `yay -S betterdiscord-installer`
## BACKUP YOUR ./CONFIG !!!
Before installing anything make sure to back up the folders for anything you're installing !

## 3a- Manual Install
Clone this repo:

`git clone https://asexylordrevan/dotfiles/ <install directory>`

Copy each directory to its proper config path:

Hyprland + Hypr Ecosystem: `mv <install directory>/hypr ~/.config`

Waybar: `mv <install directory>/waybar ~/.config`

Rofi: `mv <install directory>/rofi ~/.config`

Kitty: `mv <install directory>/kitty ~/.config`

BetterDiscord: `mv <install directory>/betterdiscord/catppuccin.theme.css ~/.config`
You can also just move the files by hand if you have config files outside of .config.
<br />
<br />

For Firefox it's a little more complicated : 

You'll need to go to `about:config` in Firefox, and accept the risks of continuing (It is extremely unlikely anything will break)

Next search for `toolkit.legacyUserProfileCustomizations.stylesheets` and set it to `true`

Now you'll need to move userChrome.css to the Chrome directory which will be in 

`~/.mozilla/<profile directory>/Chrome`

All you need to do is restart Firefox and the new theme should be applied (with missing colours).

## 4- Colours

To get colours working in the system, you'll need to install the `/colours` directory and symlink it into various directories.

To first install the colours, move the directory to .config:

`mv <install directory>/colours ~/.config`

This is where the Hypr ecosystem pulls colours from.
<br />
<br />

To get colours to work with Hyprland, Waybar, and BetterDiscord, you'll need to symlink it into each directory : 

Hyprland: `awk 'NR>=1 && NR<=79' ~/.config/colours/colours.conf > .config/hypr/colours.conf`

Waybar: `awk 'NR>=80 && NR<=107' ~/.config/colours/colours.conf > .config/waybar/colours.css`

BetterDiscord: `awk 'NR>=80 && NR<=107' ~/.config/colours/colours.conf > .config/betterdiscord/themes/colours.css`

Rofi: `awk 'NR>=109 && NR<=140' ~/.config/colours/colours.conf > .config/rofi/colours.rasi`

<br />
<br />

Colours don't currently work for Firefox
