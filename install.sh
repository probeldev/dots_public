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

rm -rf ~/.config/ranger
cp -r ranger ~/.config/ranger

rm -rf ~/.config/wlogout
cp -r wlogout ~/.config/wlogout

sudo apt install -y git
sudo apt install -y rofi
sudo apt install -y grim
sudo apt install -y slurp
sudo apt install -y blueman
sudo apt install -y brightnessctl
sudo apt install -y waybar
sudo apt install -y mako-notifier
sudo apt install -y swaylock
sudo apt install -y pulsemixer
sudo apt install -y wl-clipboard
sudo apt install -y zathura-pdf-poppler zathura zathura-djvu
sudo apt install -y linux-cpupower
sudo apt install -y mpv
sudo apt install -y swayimg
sudo apt install -y pipewire-alsa
sudo apt install -y swappy
sudo apt install -y wlogout
sudo apt install -y wf-recorder # todo add hotkey and notification
sudo apt install -y breeze      # todo: разобраться как выбирать иконки в kde приложениях

sh nwg-drawer.sh
#sh libinput-gestures.sh  # todo: remove
