FROM alpine:latest

RUN apk update && apk add wget tar && apk add bash --no-cache

RUN wget https://dl.google.com/go/go1.19.4.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf go1.19.4.linux-amd64.tar.gz

RUN export PATH=$PATH:/usr/local/go/bin

SHELL ["/bin/bash", "-c"]

RUN source ~/.bashrc

RUN git clone https://github.com/ichtrojan/go-todo.git /app

WORKDIR /app/go-todo

RUN ls -lah

RUN cp .env.example .env

RUN go get -d -v ./...