CONTAINER_NAME=wordpress
IMAGE_NAME=smackere:$(CONTAINER_NAME)

start: build run enter
restart: stop clean build run enter

build:
	docker build --tag $(IMAGE_NAME) .

run:
	docker run --name $(CONTAINER_NAME) $(IMAGE_NAME) &
	sleep 0.2

stop:
	docker stop $(CONTAINER_NAME)

enter:
	docker exec -ti $(CONTAINER_NAME) bash

ps:
	docker ps

psa:
	docker ps -a

img:
	docker images

rmi:
	docker rmi $(IMAGE_NAME)

clean: stop
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME)