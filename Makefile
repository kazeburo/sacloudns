VERSION=0.0.6
LDFLAGS=-ldflags "-w -s -X main.version=${VERSION}"
GO111MODULE=on
GOARCH ?= amd64

all: sacloudns

.PHONY: sacloudns

sacloudns: main.go
	go build $(LDFLAGS) -o sacloudns

linux: main.go
	GOOS=linux GOARCH=$(GOARCH) go build $(LDFLAGS) -o sacloudns

check:
	go test ./...
