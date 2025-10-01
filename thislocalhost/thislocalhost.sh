cd ./
a=`pwd`;

rm -rf ~/public_html
ln -s $a ~/public_html
cd ~/script/dots_public/docker/mysql/
sh rebuild.sh

