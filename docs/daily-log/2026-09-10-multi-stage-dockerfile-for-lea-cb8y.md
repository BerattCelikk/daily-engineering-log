# Multi-Stage Dockerfile for Lean Images

> **Date:** 2026-09-10 | **Category:** Docker

## Overview
This multi-stage Dockerfile streamlines the build process by separating the build environment from the final runtime image. By using a lean base image like Alpine in the second stage, we significantly reduce the final image size and attack surface, improving security and deployment speed.

```dockerfile
# syntax=docker/dockerfile:1.3

FROM golang:1.18 AS builder
WORKDIR /app
COPY . .
RUN go build -o myapp

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/myapp .
ENTRYPOINT ["./myapp"]
```
