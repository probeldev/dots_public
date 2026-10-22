docker stop lamp
docker stop mysql

docker rm lamp
docker rm mysql

# limactl stop docker
# limactl rm docker

# limactl start \
#   --name=docker \
#   --cpus=4 \
#   --memory=1 \
#   template://docker
#
#
# export DOCKER_HOST=$(limactl list docker --format 'unix://{{.Dir}}/sock/docker.sock')


docker-compose up -d
docker exec lamp apache2ctl graceful 2>/dev/null || true
