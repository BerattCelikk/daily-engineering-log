# Bloom Filters and Cuckoo Filters: Space-Efficient Membership Testing

- **Standard:** High-Availability Engineering Standard
- **Category:** `storage`
- **Author:** Berat Erol Çelik
- **Collaborator:** vKaravelv
- **Status:** APPROVED & DEPLOYED

## Summary
Probabilistic data structures for fast disk read avoidance in Cassandra and RocksDB.

## Architectural Design & Implementation Notes
In high-throughput distributed systems, correctness and resource efficiency are paramount.
This reference document outlines key operational invariants, failure modes, and zero-downtime rollout strategies.

### Operational Invariants
1. **Idempotency & Replayability:** Every operation must be safe to retry without side effects.
2. **Backpressure & Bounded Buffers:** Queue lengths and socket buffers must be strictly bounded.
3. **Observability:** Metrics, traces, and structured logs must propagate context across boundaries.
