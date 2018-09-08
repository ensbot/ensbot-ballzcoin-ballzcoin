# Build Geth in a stock Go builder container
FROM golang:1.10-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /ballzcoin
RUN cd /ballzcoin RUN cd /go-ethereum && make ballzcoinRUN cd /go-ethereum && make ballzcoin make ballzcoin

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /ballzcoin/build/bin/ballzcoin /usr/local/bin/

EXPOSE 8641 8642 31805 31805/udp
ENTRYPOINT ["geth"]
