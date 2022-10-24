#!/bin/bash
go clean
rm ./tty-share
rm ./tty-share-arm
CGO_ENABLED=0 GOOS=linux GOARCH=arm GOARM=6 go build -x -v -mod=vendor -ldflags="-s -w"
# GOOS=android GOARCH=arm GOARM=6 go build -x -v -mod=vendor -ldflags="-s -w"
file ./tty-share
upx -9 ./tty-share
ls -lth ./tty-share
mv ./tty-share ./tty-share-arm
CGO_ENABLED=0 GOOS=linux go build -x -v -mod=vendor -ldflags="-s -w"
file ./tty-share
upx -9 ./tty-share
ls -lth ./tty-share