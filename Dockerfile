# syntax=docker/dockerfile:1
FROM alpine:latest

ARG PB_VERSION=0.21.0

RUN apk add --no-cache \
    unzip \
    ca-certificates \
    openssh

# Download and unzip PocketBase
ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pb.zip
RUN unzip /tmp/pb.zip -d /pb/

WORKDIR /pb

EXPOSE 8090

# Use the persistent data directory (make sure your fly.toml mounts /pb/pb_data)
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090", "--dir", "./pb_data"]
