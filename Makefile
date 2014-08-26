.PHONY: all test clean build

all: clean test build

test:
	go test .

build:
	go build .

clean:
	go clean .

