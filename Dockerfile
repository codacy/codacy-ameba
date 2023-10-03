FROM crystallang/crystal:1.8.2-alpine as builder
WORKDIR /tmp/build
COPY . /tmp/build
RUN shards build --production

FROM alpine:3.18
RUN apk add yaml pcre2 gc libevent libgcc
COPY docs /docs
COPY --from=builder /tmp/build/bin/codacy-ameba /opt/app/

# Configure user
RUN adduser --disabled-password --gecos "" docker
RUN ["chown", "-R", "docker:docker", "/docs"]
RUN ["chown", "-R", "docker:docker", "/opt/app"]
USER docker

ENTRYPOINT ["/opt/app/codacy-ameba"]
