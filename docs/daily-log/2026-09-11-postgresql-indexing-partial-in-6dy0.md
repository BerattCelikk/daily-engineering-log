# PostgreSQL Indexing: Partial Index

> **Date:** 2026-09-11 | **Theme:** PostgreSQL & Redis Data Systems | **Category:** PostgreSQL

## Overview
Reducing index size and maintenance overhead by indexing only active order records.

## Architecture Diagram
```mermaid
flowchart TD
  Query[Query: WHERE status = 'ACTIVE'] --> Planner[Query Planner]
  Planner -->|Condition Matches| IdxScan[Index Scan on idx_orders_active]
  IdxScan -->|Fast Index Read| RowData[Fast Active Records Retrieval]
```

## Implementation
```sql
CREATE INDEX idx_orders_active_created_at
ON orders (created_at DESC)
WHERE status = 'ACTIVE';
```
