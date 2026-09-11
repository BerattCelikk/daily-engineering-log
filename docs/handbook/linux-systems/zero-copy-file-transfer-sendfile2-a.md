# Zero-Copy File Transfer: sendfile(2) and splice(2) Syscalls

- **Standard:** High-Availability Engineering Standard
- **Category:** `linux-systems`
- **Author:** Berat Erol Çelik
- **Collaborator:** vKaravelv
- **Status:** APPROVED & DEPLOYED

## Summary
Bypassing user space buffer copies for ultra-high throughput file streaming.

## Architectural Design & Implementation Notes
In high-throughput distributed systems, correctness and resource efficiency are paramount.
This reference document outlines key operational invariants, failure modes, and zero-downtime rollout strategies.

### Operational Invariants
1. **Idempotency & Replayability:** Every operation must be safe to retry without side effects.
2. **Backpressure & Bounded Buffers:** Queue lengths and socket buffers must be strictly bounded.
3. **Observability:** Metrics, traces, and structured logs must propagate context across boundaries.
