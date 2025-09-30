cd ./
a=`pwd`;

if [[ "$(uname)" == "Linux" ]]; then
	rm ~/public_html
	ln -s $a ~/public_html
    cd ~/script/dots_public/docker/mysql/
    sh rebuild.sh
else
	rm /Users/sergey/mamp
	ln -s $a /Users/sergey/mamp
fi

