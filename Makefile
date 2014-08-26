APP=gorest

VERSION=$(shell git describe --all --long)
BUILD_OUT=build/${VERSION}

.PHONY: all test clean build docker

all: clean test build docker

test:
	go test .

build:
	go build -o ${BUILD_OUT}/${APP} .

clean:
	go clean .

linux:
	xz -k -d linux.xz
	chmod 755 linux

kernel64-3.15.10:
	xz -k -d kernel64-3.15.10.xz
	chmod 755 kernel64-3.15.10

docker: linux
	./linux mem=2000M rootfstype=hostfs rw eth0=slirp,,/usr/bin/slirp-fullbolt init=$(shell pwd)/uml.sh WORKDIR=$(shell pwd) HOME=$(shell echo $HOME)
