# Docker Layer Caching & Multi-Stage

> **Date:** 2026-09-21 | **Theme:** Docker & Linux Systems | **Category:** Docker

## Overview
Optimizing container build times with multi-stage layer separation and non-root execution.

## Architecture Diagram
```mermaid
flowchart LR
  Code[Source Code] -->|Multi-Stage| Builder[Builder Stage]
  Builder -->|Extract Binary| Distroless[Distroless Image]
  Distroless -->|Run as Non-Root| Prod[Production Pod]
```

## Implementation
```dockerfile
FROM python:3.11-slim AS builder
COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt
FROM python:3.11-slim
COPY --from=builder /install /usr/local
COPY . /app
USER nonroot
```
