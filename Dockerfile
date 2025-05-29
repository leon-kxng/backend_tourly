# syntax=docker/dockerfile:1
FROM alpine:latest

# Set environment variables
ENV GIN_MODE=release

# Set working directory
WORKDIR /pb

# Install curl and unzip
RUN apk add --no-cache curl unzip

# Download the PocketBase binary (replace with desired version)
RUN curl -L -o pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.21.0/pocketbase_0.21.0_linux_amd64.zip && \
    unzip pb.zip && \
    chmod +x pocketbase && \
    rm pb.zip

# Expose the default PocketBase port
EXPOSE 8090

# Run the server
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
