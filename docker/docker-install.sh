docker run -d --name lamp -p "80:80" -p "3307:3306" -v ~/public_html:/app mattrayner/lamp:latest-1804 # https://github.com/mattrayner/docker-lamp/issues/77
