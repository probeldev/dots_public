git clone git@github.com:nwg-piotr/nwg-drawer.git
cd nwg-drawer
sudo apt install libgtk-layer-shell-dev
make get
make build
sudo make install
cd ..
rm -r nwg-drawer
