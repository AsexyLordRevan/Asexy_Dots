#!bin/bash
set -e
cd $HOME
if [$USER=root]; then
  echo "DO NOT RUN AS ROOT"
  exit 1
fi
#-----Installs/Updates all required packages + updates system-----#
sudo pacman -S discord vivaldi kitty rofi-wayland hypr{land,lock,idle,paper,pm,polkitagent} grim slurp mako cliphist brightnessctl playerctl
sudo pacman -Syu
echo "Packages installed, system updated"
#-----Clones repo-----#
git clone https://github.com/asexylordrevan/asexy_dots $HOME/asexy_dots
echo "Repository cloned"
#-----Hyprland-----#
if [-d $HOME/.config/hypr]; then mv $HOME/.config/hypr $HOME/.config/hypr.backup
fi 
mv $HOME/asexy_dots/hypr $HOME/.config/hypr
echo "Hyprland config installed"
#-----Waybar-----#
if [-d $HOME/.config/waybar]; then mv $HOME/.config/waybar $HOME/.config/waybar.backup
fi
mv $HOME/asexy_dots/waybar $HOME/.config/waybar
echo "Waybar config installed"
#-----Kitty-----#
if [-d $HOME/.config/kitty]; then mv $HOME/.config/kitty $HOME/.config/kitty.backup
fi
mv $HOME/asexy_dots/kitty $HOME/.config/kitty
echo "Kitty config installed"
#-----Rofi-----#
if [-d $HOME/.config/rofi]; then mv $HOME/.config/rofi $HOME/.config/rofi.backup
fi
mv $HOME/asexy_dots/rofi $HOME/.config/rofi
echo "Rofi config installed"
#-----Mako-----#
if [-d $HOME/.config/mako]; then mv $HOME/.config/mako $HOME/.config/mako.backup
fi
mv $HOME/asexy_dots/mako $HOME/.config/mako
echo "Mako config installed"
#-----Wallpapers-----#
if [-d $HOME/Documents/wallpapers]; then mv $HOME/Documents/wallpapers $HOME/Documents/wallpapers.backup
fi
mv $HOME/asexy_dots/wallpapers $HOME/Documents/wallpapers
echo "Wallpapers installed"
#-----Sync-----#
if [-f $HOME/.config]; then mv $HOME/asexy_dots/.sync.sh .sync.sh
#-----Install fonts-----#
git clone https://github.com/epk/SF-Mono-Nerd-Font
mv "SF-Mono-Nerd-Font/SFMono Regular Nerd Font Complete.otf" ".local/share/fonts/SFMono Regular Nerd Font Complete.otf"
rm -r SF-Mono-Nerd-Font
#-----Install BetterDiscord-----#
git clone https://github.com/BetterDiscord/BetterDiscord.git $HOME/BetterDiscord
cd BetterDiscord
npm install pnpm
pnpm install
pnpm build
pnpm inject
echo "BetterDiscord installed"
mv $HOME/asexy_dots/BetterDiscord/catppuccin.theme.css $HOME/.config/BetterDicord/themes/asexy_catppuccin.theme.css
#-----Colours-----#
if [-d $HOME/.config/colours]; then mv $HOME/.config/colours $HOME/.config/colours_backup
fi
mv $HOME/asexy_dots/colours $HOME/.config/colours
echo "Colours installed"
bash .sync.sh
echo "Colours synced"
#-----Remove install directory-----#
rm -r $HOME/asexy_dots
#-----End messages-----#
echo "All dotfiles installed into $HOME/.config"
echo "Old configurations are all named '<directory>.backup'"
echo "Wallpapers are in $HOME/Documents/wallpapers, all are made with ImageGoNord, check it out on their Github"
echo "https://github.com/schroedinger-hat/ImageGoNord-pip"
echo "An uninstall script is provided in the Dotfiles Repo"
echo "https://github.com/asexylordrevan/asexy_dots"
