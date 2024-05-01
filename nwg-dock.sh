git clone https://github.com/nwg-piotr/nwg-dock
cd nwg-dock
sudo apt install -y libgtk-layer-shell-dev
sudo apt install -y golang-gir-gio-2.0-dev
sudo apt install -y libcairo2-dev
sudo apt install -y libgtk-3-dev
make get
make build
sudo make install
cd ..
rm -r nwg-dock
