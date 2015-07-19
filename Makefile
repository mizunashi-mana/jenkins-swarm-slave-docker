all: build

build:
	@docker build --tag=lekeplass/jenkins-swarm-slave .
