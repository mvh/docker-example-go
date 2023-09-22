FROM golang:1.21-alpine3.18 AS builder

WORKDIR /app

ADD /app /app
#RUN export BUILD_TIME=`date` && go build -o server -ldflags="-X main.nowstr=\'${BUILD_TIME}\'"
RUN export BUILD_TIME=`date` && go build -o server -ldflags "-X \"main.nowstr=${BUILD_TIME}\""
#RUN go build -o server

FROM alpine:3.18
#FROM ubuntu:latest
RUN apk update && \
   apk add ca-certificates && \
   update-ca-certificates && \
   rm -rf /var/cache/apk/*
WORKDIR /app
COPY --from=builder /app/server /app/server
EXPOSE 8080
USER nobody:nogroup
CMD ./server -addr 0.0.0.0:8080
