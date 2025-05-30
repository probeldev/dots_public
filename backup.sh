rm -rf nixos 
cp -r /etc/nixos nixos

rm -rf niri
cp -r ~/.config/niri niri

rm -rf niri-screen-time
cp -r ~/.config/niri-screen-time niri-screen-time

cp ~/.config/hypr/hyprland.conf hyprland.conf
cp ~/.config/hypr/hyprlock.conf hyprlock.conf
cp ~/.config/hypr/hypridle.conf hypridle.conf
cp ~/.config/hypr/hyprpaper.conf hyprpaper.conf

cp ~/.config/waybar/style.css waybar/style.css
cp ~/.config/waybar/config waybar/config

cp ~/.zshenv zshenv

rm -rf swaync
cp -r ~/.config/swaync swaync

rm -rf foot
cp -r ~/.config/foot foot

rm -rf ghostty
cp -r ~/.config/ghostty ghostty

rm -rf superfile
cp -r ~/.config/superfile/ superfile
