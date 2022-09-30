#!/bin/bash
go clean
GOOS=linux GOARCH=arm GOARM=6 go build -x -v -mod=vendor -ldflags="-s -w"
# GOOS=android GOARCH=arm GOARM=6 go build -x -v -mod=vendor -ldflags="-s -w"
upx -9 ./tty-share
ls -lth ./tty-share