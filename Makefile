LDFLAGS := "-s -w "
.PHONY: test
test:
	cd pkg; go test ./...
.PHONY: build
build:
	mkdir -p bin
	go build -ldflags=${LDFLAGS} -o bin/go-iptables ./iptables
alpine:
	mkdir -p bin
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags=${LDFLAGS} -o bin/go-iptables ./iptables
run:
	chmod +x bin/go-iptables &&./bin/go-iptables
trace:
	LOGLEVEL=TRACE ./bin/go-iptables
debug:
	LOGLEVEL=DEBUG ./bin/go-iptables
clean:
	rm -r bin
