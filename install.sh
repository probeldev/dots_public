mkdir ~/.config/sway
cp config ~/.config/sway/config

mkdir ~/.config/waybar
cp waybar/style.css ~/.config/waybar/style.css
cp waybar/config ~/.config/waybar/config

mkdir ~/.config/swayimg
cp swayimg/config ~/.config/swayimg/config

mkdir ~/.config/mako
cp mako/config ~/.config/mako/config

mkdir ~/.config/rofi
cp rofi/catppuccin.rasi ~/.config/rofi/catppuccin.rasi
cp rofi/config.rasi ~/.config/rofi/config.rasi


sudo apt install -y lightdm
sudo apt install -y git
sudo apt install -y rofi
sudo apt install -y grim
sudo apt install -y slurp
sudo apt install -y blueman
sudo apt install -y brightnessctl
sudo apt install -y waybar
sudo apt install -y thunar
sudo apt install -y mako-notifier
sudo apt install -y swaylock
sudo apt install -y pulsemixer
sudo apt install -y wl-clipboard
sudo apt install -y zathura-pdf-poppler zathura zathura-djvu
sudo apt install -y linux-cpupower
sudo apt install -y mpv
sudo apt install -y swayimg
sudo apt install -y pipewire-alsa
sudo apt install -y mousepad
sudo apt install -y swappy

sh nwg-drawer.sh
#sh libinput-gestures.sh  # todo: remove

