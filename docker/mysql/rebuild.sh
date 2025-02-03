sudo setfacl --modify user:sergey:rw /var/run/docker.sock

docker stop lamp
docker stop mysql

docker rm lamp
docker rm mysql

docker-compose up -d
docker exec -it lamp /etc/init.d/apache2 restart
