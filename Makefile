APP=gorest

VERSION=$(shell git describe --all --long)
BUILD_OUT=build/${VERSION}

.PHONY: all test clean build integration

all: clean test build integration

test:
	go test .

build:
	go build -o ${BUILD_OUT}/${APP} .

clean:
	go clean .

integration:
  linux quiet mem=2G rootfstype=hostfs rw eth0=slirp,,/usr/bin/slirp-fullbolt init=$(pwd)/uml.sh WORKDIR=$(pwd) HOME=$HOME
  
