APP=gorest

WORKDIR=$(shell pwd)
VERSION=$(shell git describe --all --long)
BUILD_OUT=build/${VERSION}

.PHONY: all test clean build container

all: clean test build container

test:
	go test .

build:
	mkdir -p ${BUILD_OUT}/${APP}
	go build -o ${BUILD_OUT}/${APP}/${APP} .

clean:
	go clean .

container:
	cd /tmp/root/
	strace -ff ${WORKDIR}/bin/nsinit exec /bin/echo "Hello world"
	
