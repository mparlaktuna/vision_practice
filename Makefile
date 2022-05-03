.PHONY: create_docker

create_docker:
	docker build . -t vision_practice

run: create_docker
	docker run -v ${PWD}:/app vision_practice 
