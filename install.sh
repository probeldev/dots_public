mkdir ~/.config/hypr
cp hyprland.conf ~/.config/hypr/hyprland.conf
cp hyprlock.conf ~/.config/hypr/hyprlock.conf
cp hyprpaper.conf ~/.config/hypr/hyprpaper.conf

mkdir ~/.config/waybar
cp waybar/style.css ~/.config/waybar/style.css
cp waybar/config ~/.config/waybar/config

rm -rf ~/.config/swaync
mkdir ~/.config/swaync
cp -r ~/.config/swaync swaync

rm -r ~/.config/rofi
cp -r rofi ~/.config/rofi

rm -rf ~/.config/wlogout
cp -r wlogout ~/.config/wlogout

cp zshenv ~/.zshenv

sudo apt install -y hyprland
sudo apt install -y network-manager-gnome
sudo apt install -y htop
sudo apt install -y hyprpaper
sudo apt install -y alacritty
sudo apt install -y git
sudo apt install -y rofi
sudo apt install -y grim
sudo apt install -y slurp
sudo apt install -y blueman
sudo apt install -y brightnessctl
sudo apt install -y waybar
# sudo apt install -y mako-notifier
sudo apt install -y pulsemixer
sudo apt install -y wl-clipboard
sudo apt install -y linux-cpupower
sudo apt install -y pipewire-alsa
sudo apt install -y wlogout
sudo apt install -y wf-recorder # todo add hotkey and notification
sudo apt install -y breeze      # todo: разобраться как выбирать иконки в kde приложениях
sudo apt install -y firefox-esr
sudo apt install -y swayidle
sudo apt install -y redshift
sudo apt install -y swappy

sudo apt install -y gnome-keyring # связка ключей для всяких скайпов

# sudo apt install -y wofi
sudo apt install -y sway-notification-center

# Настройка блютуз наушников
sudo apt install -y pipewire-pulse pipewire-alsa pulseaudio-utils alsa-utils
sudo apt install -y libspa-0.2-bluetooth
sudo apt remove -y pulseaudio-module-bluetooth

# sh nwg-drawer.sh
#sh libinput-gestures.sh  # todo: remove
