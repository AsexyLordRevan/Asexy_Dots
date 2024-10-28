#!bin/bash

#-----Installs/Updates all required packages + updates system-----#
sudo pacman -S discord, firefox, kitty, rofi, hypr{land,lock,idle,paper}
sudo pacman -Syu

#-----Clones repo-----#
git clone https://github.com/asexylordrevan/dotfiles ~/asexy_dots

#-----Hyprland-----#
if [-d ~/.config/hypr]; then
  mv ~/.config/hypr ~/.config/hypr_backup
  mv ~/asexy_dots/hypr ~/.config/hypr
fi

#-----Waybar-----#
if [-d ~/.config/waybar]; then
  mv ~/.config/waybar ~/.config/waybar_backup
  mv ~/asexy_dots/waybar ~/.config/waybar
fi

#-----Kitty-----#
if [-d ~/.config/kitty]; then
  mv ~/.config/kitty ~/.config/kitty_backup
  mv ~/asexy_dots/kitty ~/.config/kitty
fi

#-----Hyprland-----#
if [-d ~/.config/rofi]; then
  mv ~/.config/rofi ~/.config/rofi_backup
  mv ~/asexy_dots/rofi ~/.config/rofi
fi

#-----Colours-----#
if [-d ~/.config/colours]; then
  mv ~/.config/colours ~/.config/colours_backup
  mv ~/asexy_dots/colours ~/.config/colours
fi
ln -s ~/.config/colours/colours.css .config/waybar/
#Finds Firefox profile directory
cd ~/.mozilla/firefox/
if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]
then PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-)
else PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//')
fi

ln -s ~/.config/colours/colours.css .mozilla/firefox/$PROFPATH/chrome

#-----Install BetterDiscord-----#
git clone https://github.com/BetterDiscord/BetterDiscord.git ~/g
