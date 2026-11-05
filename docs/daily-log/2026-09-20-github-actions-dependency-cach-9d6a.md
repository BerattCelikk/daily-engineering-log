# GitHub Actions Dependency Cache Optimization

> **Date:** 2026-09-20 | **Theme:** CI/CD & Observability | **Category:** CI-CD

## Overview
Accelerating continuous integration pipelines by caching external module dependencies using lockfile hashing.

## Architecture Diagram
```mermaid
flowchart LR
  Commit[New Git Commit] --> Runner[GitHub Actions Runner]
  Runner --> CacheCheck{Go Cache Key Hit?}
  CacheCheck -->|Yes| Restored[Restore Cache & Instant Build]
  CacheCheck -->|No| Fetch[Download Modules & Save Cache]
```

## Implementation
```yaml
- name: Cache Go modules
  uses: actions/cache@v4
  with:
    path: ~/go/pkg/mod
    key: ${{ runner.os }}-go-${{ hashFiles('**/go.sum') }}
    restore-keys: |
      ${{ runner.os }}-go-
```
