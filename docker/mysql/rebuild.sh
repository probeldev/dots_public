#sudo docker-compose  up -d
sudo docker run --name localhost-mysql -e MYSQL_ROOT_PASSWORD=12345678 -p 3306:3306 -d arm64v8/mysql:latest
