#!bin/bash
set -e
cd ~
#-----Installs/Updates all required packages + updates system-----#
sudo pacman -S discord, firefox, kitty, rofi, hypr{land,lock,idle,paper}
sudo pacman -Syu
echo "Packages installed, system updated"
#-----Clones repo-----#
git clone https://github.com/asexylordrevan/asexy_dots ~/asexy_dots
echo "Repository cloned"
#-----Hyprland-----#
if [-d ~/.config/hypr]; then
  mv ~/.config/hypr ~/.config/hypr.backup
fi mv ~/asexy_dots/hypr ~/.config/hypr
echo "Hyprland config installed"
#-----Waybar-----#
if [-d ~/.config/waybar]; then
  mv ~/.config/waybar ~/.config/waybar.backup
fi
mv ~/asexy_dots/waybar ~/.config/waybar
echo "Waybar config installed"
#-----Kitty-----#
if [-d ~/.config/kitty]; then
  mv ~/.config/kitty ~/.config/kitty.backup
fi
mv ~/asexy_dots/kitty ~/.config/kitty
echo "Kitty config installed"
#-----Rofi-----#
if [-d ~/.config/rofi]; then
  mv ~/.config/rofi ~/.config/rofi.backup
fi
mv ~/asexy_dots/rofi ~/.config/rofi
echo "Rofi config installed"
#-----Mako-----#
if [-d ~/.config/mako]; then
  mv ~/.config/mako ~/.config/mako.backup
fi
mv ~/asexy_dots/mako ~/.config/mako
echo "Mako config installed"
#-----Wallpapers-----#
if [-d ~/Documents/wallpapers]; then
  mv ~/Documents/wallpapers ~/Documents/wallpapers.backup
fi
mv ~/asexy_dots/wallpapers ~/Documents/wallpapers
echo "Wallpapers installed"
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
mv ~/asexy_dots/BetterDiscord/catppuccin.theme.css ~/.config/BetterDicord/themes/asexy_catppuccin.theme.css
#-----Colours-----#
if [-d ~/.config/colours]; then
  mv ~/.config/colours ~/.config/colours_backup
fi
mv ~/asexy_dots/colours ~/.config/colours
echo "Colours installed"
bash .sync.sh
echo "Colours synced"
#-----Remove install directory-----#
rm -r ~/asexy_dots
#-----End messages-----#
echo "All dotfiles installed into ~/.config"
echo "Old configurations are all named '<directory>.backup'"
echo "Wallpapers are in ~/Documents/wallpapers, all are made with ImageGoNord, check it out on their Github"
echo "https://github.com/schroedinger-hat/ImageGoNord-pip"
echo "An uninstall script is provided in the Dotfiles Repo"
echo "https://github.com/asexylordrevan/asexy_dots"
