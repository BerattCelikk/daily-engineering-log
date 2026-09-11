# Engineering Log

<!-- STATS-START -->
[![Total Notes](https://img.shields.io/badge/Total%20Notes-3-blue?style=flat-square&logo=gitbook)](docs/README.md)
[![Categories](https://img.shields.io/badge/Categories-7-emerald?style=flat-square&logo=buffer)](docs/README.md)
[![CI Quality Gate](https://img.shields.io/badge/CI%20Gate-Passing-brightgreen?style=flat-square&logo=githubactions)](.github/workflows/ci.yml)
[![Daily Engineering](https://img.shields.io/badge/Pipeline-Active-blueviolet?style=flat-square)](https://github.com/BerattCelikk/daily-engineering-log)
<!-- STATS-END -->

A collection of daily production engineering notes, cloud-native architecture patterns, and technical references.

## Recent Notes

<!-- TIL-START -->
| Date | Title | Category | Details |
| :--- | :--- | :--- | :--- |
| 2026-09-11 | Optimizing Query Performance with Partial Indexes and Distributed Locks | PostgreSQL | [View](docs/daily-log/2026-09-11-optimizing-query-performance-w-r4eg.md) |
| 2026-09-11 | Optimizing Queries with PostgreSQL Partial Indexes and Analyzing Performance | PostgreSQL | [View](docs/daily-log/2026-09-11-optimizing-queries-with-postgr-xq1s.md) |
| 2026-09-10 | Multi-Stage Dockerfile for Lean Images | Docker | [View](docs/daily-log/2026-09-10-multi-stage-dockerfile-for-lea-cb8y.md) |
<!-- TIL-END -->

## 🎯 Architecture Roadmap & Milestones
- 🗺️ **Active Milestone:** [v1.0 - Core Cloud & Distributed Systems Architecture Roadmap](https://github.com/BerattCelikk/daily-engineering-log/milestone/1)
- 📌 **Tracked Engineering Epics:** 14 production roadmap issues categorized across Containers, Kubernetes, Go Concurrency, and Distributed Storage.

---

## 🛠️ Technology Stack & Engineering Disciplines

| Discipline | Core Technologies | Primary Production Patterns |
| :--- | :--- | :--- |
| **Containers & Hardening** | ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white) ![Distroless](https://img.shields.io/badge/Google-Distroless-4285F4?style=flat-square&logo=google&logoColor=white) | Multi-stage layer caching, non-root execution, minimal attack surface |
| **Cloud-Native & Orchestration** | ![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white) ![Helm](https://img.shields.io/badge/Helm-0F1689?style=flat-square&logo=helm&logoColor=white) | HPA autoscaling, zero-trust network policies, pod disruption budgets |
| **High-Concurrency Systems** | ![Go](https://img.shields.io/badge/Go-00ADD8?style=flat-square&logo=go&logoColor=white) | Goroutine worker pools, `sync.RWMutex`, `sync.Pool` memory reuse |
| **Async Microservices** | ![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white) ![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=flat-square&logo=fastapi&logoColor=white) | Structured concurrency (`asyncio.TaskGroup`), non-blocking connection pooling |
| **Distributed Data & Caching** | ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat-square&logo=postgresql&logoColor=white) ![Redis](https://img.shields.io/badge/Redis-DC382D?style=flat-square&logo=redis&logoColor=white) | Partial indexes, EXPLAIN ANALYZE tuning, distributed locks with TTL |
| **Infrastructure as Code** | ![Terraform](https://img.shields.io/badge/Terraform-844FBA?style=flat-square&logo=terraform&logoColor=white) | S3 remote state locking with DynamoDB, automated drift reconciliation |
| **CI/CD & Observability** | ![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat-square&logo=githubactions&logoColor=white) ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white) | 3-Job matrix quality gates, module cache hashing, SLO-based alerting |

---

## 📈 Star History

<p align="center">
  <a href="https://star-history.com/#BerattCelikk/daily-engineering-log&Date">
    <img src="https://api.star-history.com/svg?repos=BerattCelikk/daily-engineering-log&type=Date&theme=dark" alt="Star History Chart" width="100%" />
  </a>
</p>

