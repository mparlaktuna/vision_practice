.PHONY: create_docker

create_docker:
	docker build . -t vision_practice

run: create_docker
	xhost + && docker run --privileged -e DISPLAY=${DISPLAY} --net=host -v /tmp/.X11-unix:/tmp/.X11-unix -v ${PWD}:/app vision_practice 
