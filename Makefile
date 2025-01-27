REVISION := $(shell git rev-parse --short HEAD || echo unknown)
VERSION := $(shell git describe --tags || echo dev)
VERSION := $(shell echo $(VERSION) | sed -e 's/^v//g')

all:
	# make runner-caches

test:
	go test -cover

build: runner-caches

runner-caches: cleanup.go
	go build -ldflags "-X main.version $(VERSION) -X main.revision $(REVISION)"

clean:
	rm -f runner-caches
