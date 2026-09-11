# Security Policy & Vulnerability Disclosure

## Supported Versions
This engineering repository enforces automated static security scanning, linter verification, and dependency analysis on the following branch:

| Branch | Supported | Security Gate |
| :--- | :---: | :--- |
| `main` | ✅ Yes | CodeQL, Semgrep & Trivy Static Analysis |

## Reporting a Vulnerability
We prioritize the security of all automation workflows, cloud architectures, and code snippets documented in this repository.

If you discover a potential vulnerability, hardcoded credential, or security weakness:
1. **Do not disclose publicly** in GitHub Issues or Discussions.
2. Please report the issue privately via email to: **[beratcelikk02@gmail.com](mailto:beratcelikk02@gmail.com)**.
3. You can also utilize GitHub's [Private Vulnerability Reporting](https://github.com/BerattCelikk/daily-engineering-log/security/advisories/new) feature directly in this repository.

### SLA & Remediation
- **Acknowledgment:** Within 24-48 hours.
- **Triage & Patching:** High/Critical severity issues are addressed with priority patches and published via repository Releases.

## Automated Security Hygiene
- **Zero Secrets Policy:** Automated secret scanning is enforced on all branches.
- **CodeQL SAST:** Daily and commit-triggered static application security testing.
- **Distroless & Non-Root:** All container specifications strictly adhere to minimal attack-surface architectures.
