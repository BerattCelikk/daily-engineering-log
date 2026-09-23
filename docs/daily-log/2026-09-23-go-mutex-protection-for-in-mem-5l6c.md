# Go Mutex Protection for In-Memory Store

> **Date:** 2026-09-23 | **Theme:** Go & High-Concurrency Systems | **Category:** Go

## Overview
Thread-safe in-memory map access using sync.RWMutex for concurrent goroutines.

## Architecture Diagram
```mermaid
flowchart LR
  Req1[Reader Request 1] -->|RLock()| State[(Safe Counter)]
  Req2[Reader Request 2] -->|RLock()| State
  WriteReq[Writer Request] -->|Lock() Exclusive| State
```

## Implementation
```go
type SafeCounter struct {
    mu sync.RWMutex
    val map[string]int
}

func (c *SafeCounter) Inc(key string) {
    c.mu.Lock()
    defer c.mu.Unlock()
    c.val[key]++
}
```
