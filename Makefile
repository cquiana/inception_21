FILE=srcs/docker-compose.yml
DIR=/home/${USER}/data
DOCKER=$$(docker ps -a -q)

all:	create build up

create:
		mkdir -p ${DIR}/html
		mkdir -p ${DIR}/mariadb

build:
		docker-compose -f ${FILE} build

up:
		docker-compose -f ${FILE} up

down:
		docker-compose -f ${FILE} down

clean:
		docker stop ${DOCKER}
		docker rm ${DOCKER}

prune:
		docker system prune -a
		docker volume prune
		sudo rm -rf ${DIR}
