# Contributing to Daily Engineering Log

Thank you for your interest in contributing to the **Daily Engineering Log**! This repository serves as a centralized, production-grade reference library for Cloud, DevOps, and Platform Engineering architectures.

---

## 📐 Standards & Principles

1. **Production Realism:** All code snippets, Kubernetes manifests, and Terraform blocks must reflect authentic, hardened production standards (non-root users, least-privilege, timeouts, connection pooling).
2. **Native Mermaid Diagrams:** Every architectural note should include a clear visual flowchart (`flowchart LR` or `flowchart TD`) rendered natively by GitHub.
3. **Structured Git-Flow:**
   - Always branch from `main` using the naming convention `feature/notes-YYYY-MM-DD-<slug>`.
   - Use Conventional Commits: `docs:`, `feat:`, `fix:`, `refactor:`.
   - Link official GitHub Issues using `Closes #<issue_number>`.

---

## 🛠️ Development & CI Verification

Before submitting a Pull Request, ensure that all automated checks in `.github/workflows/ci.yml` pass:
- **Repository Structure & Integrity Gate:** Ensures core folders (`docs/`, `docs/daily-log/`) exist.
- **Markdown & Documentation Standards:** Enforces H1 heading standards and documentation integrity.
- **Syntax & Schema Validation:** Validates YAML and Python configuration syntax.

---

## 💬 Discussions & Q&A

For broader architectural debates, benchmarks, and technology trade-offs, please participate in our official [GitHub Discussions](https://github.com/BerattCelikk/daily-engineering-log/discussions).
