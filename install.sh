#!bin/bash
set -e
cd ~
#-----Installs/Updates all required packages + updates system-----#
sudo pacman -S discord, firefox, kitty, rofi, hypr{land,lock,idle,paper}
sudo pacman -Syu
echo "Packages installed, system updated"
#-----Clones repo-----#
git clone https://github.com/asexylordrevan/dotfiles ~/asexy_dots
echo "Repository cloned"
#-----Hyprland-----#
if [-d ~/.config/hypr]; then
  mv ~/.config/hypr ~/.config/hypr_backup
fi mv ~/asexy_dots/hypr ~/.config/hypr
echo "Hyprland config installed"
#-----Waybar-----#
if [-d ~/.config/waybar]; then
  mv ~/.config/waybar ~/.config/waybar_backup
fi
mv ~/asexy_dots/waybar ~/.config/waybar
echo "Waybar config installed"
#-----Kitty-----#
if [-d ~/.config/kitty]; then
  mv ~/.config/kitty ~/.config/kitty_backup
fi
mv ~/asexy_dots/kitty ~/.config/kitty
echo "Kitty config installed"
#-----Rofi-----#
if [-d ~/.config/rofi]; then
  mv ~/.config/rofi ~/.config/rofi_backup
fi
mv ~/asexy_dots/rofi ~/.config/rofi
echo "Rofi config installed"
#-----Sync-----#
if [-f ~/.config]; then
  mv ~/asexy_dots/.sync.sh .sync.sh
#-----Install BetterDiscord-----#
git clone https://github.com/BetterDiscord/BetterDiscord.git ~/BetterDiscord
cd BetterDiscord
npm install pnpm
pnpm install
pnpm build
pnpm inject
echo "BetterDiscord installed"
#-----Colours-----#
if [-d ~/.config/colours]; then
  mv ~/.config/colours ~/.config/colours_backup
fi
mv ~/asexy_dots/colours ~/.config/colours
echo "Colours installed"
bash .sync.sh
echo "Colours synced"
