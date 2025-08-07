FROM alpine:latest
LABEL MAINTAINER="https://github.com/muzamil-tech/zphisher"
WORKDIR /muzamil/
ADD . /muzamil
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./muzamil.sh"
