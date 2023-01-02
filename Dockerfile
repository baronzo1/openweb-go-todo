FROM golang:1.16-alpine

RUN apk update && apk add wget tar && apk add --update git

#RUN wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz

#RUN tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz

RUN git clone https://github.com/ichtrojan/go-todo.git /app

WORKDIR /app/go-todo

RUN go get -d -v ./...