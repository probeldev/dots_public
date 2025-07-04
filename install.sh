mkdir -p ~/.config/hypr
cp hypr/hyprland.conf ~/.config/hypr/hyprland.conf
cp hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
cp hypr/hypridle.conf ~/.config/hypr/hypridle.conf
cp hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

mkdir ~/.config/waybar
cp waybar/style.css ~/.config/waybar/style.css
cp waybar/config ~/.config/waybar/config

rm -rf ~/.config/swaync
cp -r swaync ~/.config/swaync

rm -rf ~/.config/niri
cp -r niri ~/.config/niri

rm -rf ~/.config/niri-screen-time
cp -r niri-screen-time ~/.config/niri-screen-time

rm -rf ~/.config/foot
cp -r foot ~/.config/foot


rm -rf ~/.config/ghostty 
cp -r ghostty ~/.config/ghostty 


rm -rf ~/.config/superfile/
cp -r superfile ~/.config/superfile/ 

cp zshenv ~/.zshenv

sudo apt install -y hyprland
sudo apt install -y network-manager-gnome
sudo apt install -y htop
sudo apt install -y hyprpaper
sudo apt install -y foot
sudo apt install -y git
sudo apt install -y rofi
sudo apt install -y grim
sudo apt install -y slurp
sudo apt install -y brightnessctl
sudo apt install -y waybar
# sudo apt install -y mako-notifier
sudo apt install -y pulsemixer
sudo apt install -y wl-clipboard
sudo apt install -y linux-cpupower
sudo apt install -y pipewire-alsa
sudo apt install -y wf-recorder # todo add hotkey and notification
sudo apt install -y breeze      # todo: разобраться как выбирать иконки в kde приложениях
sudo apt install -y firefox-esr
sudo apt install -y swayidle
sudo apt install -y redshift
sudo apt install -y swappy
sudo apt install -y fonts-firacode

sudo apt install -y gnome-keyring # связка ключей для всяких скайпов

# sudo apt install -y wofi
sudo apt install -y sway-notification-center

# sh nwg-drawer.sh
#sh libinput-gestures.sh  # todo: remove

sudo apt-get install lxpolkit

sudo apt install acpi # для отображения заряда аккумулятора на hyprlock
