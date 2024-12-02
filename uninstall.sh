#!bin/bash
set -e
cd ~

#-----Colours-----#
if [! -d ~/.config/hypr.backup] || [! -d ~/.config/waybar.backup] || [! -d ~/.config/BetterDiscord] || [! -d ~/.config/rofi.backup]; then
  rm -r ~/.config/colours
  if [-d ~/.config/colours.backup]; then
    mv ~/.config/colours.backup ~/.config/colours
fi
#-----Hyprland-----#
if [-d ~/.config/hypr.backup]; then
  rm -r ~/.config/hypr
  mv ~/.config/hypr.backup ~/.up]config/hypr
  echo "Hyprland config uninstalled"
fi
#-----Waybar-----#
if [-d ~/.config/waybar.backup]; then
  rm -r ~/.config/waybar
  mv ~/.config/waybar.backup ~/.config/waybar
  echo "Waybar config uninstalled"
fi
#-----Rofi-----#
if [-d ~/.config/rofi.backup]; then
  rm -r ~/.config/rofi
  mv ~/.config/rofi.backup ~/.config/rofi
  echo "Rofi config uninstalled"
fi
#-----Mako-----#
if [-d ~/.config/mako.backup]; then
  rm -r ~/.config/mako
  mv ~/.config/mako.backup ~/.config/mako
  echo "Mako config uninstalled"
fi
#-----Kitty-----#
if [-d ~/.config/kitty.backup]; then
  rm -r ~/.config/kitty
  mv ~/.config/kitty.backup ~/.config/kitty
  echo "Kitty config uninstalled"
fi
#-----Sync-----#
rm .sync.sh
echo "Sync uninstalled"
#-----Wallpapers-----#
rm -r ~/Documents/wallpapers
if [-d ~/Documents/wallpapers.backup]; then
  mv ~/Documents/wallpapers.backup ~/Documents/wallpapers
fi
echo "wallpapers uninstalled"

echo "Colours uninstalled"
echo "All backed up configurations have been restored. If a configuration was not backed up, did not exist, or was deleted, the previous configuration remains"
echo "If Hyprland, Waybar, BetterDiscord, or Rofi don't have backups, the colours file remains"
echo "Sync and wallpapers have been removed "
