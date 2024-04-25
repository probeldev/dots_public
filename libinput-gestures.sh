git clone git@github.com:bulletmark/libinput-gestures.git
sudo apt-get install wmctrl xdotool
sudo apt-get install libinput-tools
cd libinput-gestures
sudo ./libinput-gestures-setup install
libinput-gestures-setup autostart start
cd ..
rm -r libinput-gestures
sudo gpasswd -a $USER input
cp libinput-gestures.conf ~/.config/libinput-gestures.conf
