# Start from the golang:1.16-alpine image
FROM golang:1.16-alpine AS builder

# Set the working directory
WORKDIR /app

# Install the Git package
RUN apk update && apk add git

# Clone the repository
RUN git clone https://github.com/ichtrojan/go-todo.git .

# Set the working directory to the app folder
WORKDIR /app/go-todo

# Install dependencies
RUN go get -d -v ./...

# Build the app
RUN go build -o main .

# Start from a small image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Copy the binary from the builder image
COPY --from=builder /app/go-todo/main .