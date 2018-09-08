.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/ballzcoin/ballzcoin/cmd/swarm
	go build -o bin/geth     github.com/ballzcoin/ballzcoin/cmd/geth
	go build -o bin/bootnode github.com/ballzcoin/ballzcoin/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/ballzcoin/ballzcoin/swarm/...
