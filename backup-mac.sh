rsync -a --delete --exclude result /etc/nix-darwin/ nix-darwin/


rm -rf rio 
cp -r ~/.config/rio rio 

rm -rf kitty
cp -r ~/.config/kitty kitty

rm -rf rift
cp -r ~/.config/rift rift

rm -rf sketchybar 
cp -r ~/.config/sketchybar sketchybar

rm -rf aerospace
mkdir aerospace
cp ~/.aerospace.toml aerospace/.aerospace.toml 

rm -rf skhd
mkdir skhd
cp ~/.skhdrc skhd/.skhdrc
