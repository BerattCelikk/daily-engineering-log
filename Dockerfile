# Multi-stage production container build
FROM golang:1.22-alpine AS builder

WORKDIR /build
COPY cmd/eng-cli/main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /build/eng-cli main.go

# Minimal runtime image
FROM alpine:3.20

LABEL org.opencontainers.image.source="https://github.com/BerattCelikk/daily-engineering-log"
LABEL org.opencontainers.image.description="Cloud & Distributed Systems Engineering Daily Toolkit & CLI"
LABEL org.opencontainers.image.licenses="MIT"

WORKDIR /app
COPY --from=builder /build/eng-cli /usr/local/bin/eng-cli

# Run as non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

ENTRYPOINT ["eng-cli"]
CMD ["--stats"]
