#!/usr/bin/env bash
# daily-log: Interactive CLI for BerattCelikk/daily-engineering-log
# Zero-dependency Bash client with ANSI colors

set -e

REPO="BerattCelikk/daily-engineering-log"
API_BASE="https://api.github.com/repos/${REPO}"

CYAN='\033[0;36m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'

show_help() {
  echo -e "${BOLD}${CYAN}daily-log CLI${NC} - Terminal client for Daily Engineering Log"
  echo -e "${BLUE}Author:${NC} Berat Erol Çelik (https://github.com/BerattCelikk)"
  echo -e "${BLUE}Repository:${NC} https://github.com/${REPO}"
  echo ""
  echo -e "${BOLD}USAGE:${NC}"
  echo -e "  daily-log <command> [arguments]"
  echo ""
  echo -e "${BOLD}COMMANDS:${NC}"
  echo -e "  ${GREEN}latest${NC}             Fetch and display today's latest engineering note"
  echo -e "  ${GREEN}search <query>${NC}     Search notes by keyword (e.g. docker, go, postgres)"
  echo -e "  ${GREEN}categories${NC}         List all 7 engineering curriculum disciplines"
  echo -e "  ${GREEN}adrs${NC}               List Architecture Decision Records (ADRs)"
  echo -e "  ${GREEN}version${NC}            Display current version"
  echo -e "  ${GREEN}help${NC}               Display this help message"
}

case "$1" in
  latest)
    echo -e "${CYAN}==> Fetching latest engineering note from GitHub...${NC}"
    LATEST_FILE=$(curl -sSL "${API_BASE}/contents/docs/daily-log" | grep '"name"' | grep '\.md"' | tail -n 1 | cut -d '"' -f 4)
    if [ -n "$LATEST_FILE" ]; then
      echo -e "${GREEN}==> Note Found: ${BOLD}${LATEST_FILE}${NC}\n"
      curl -sSL "https://raw.githubusercontent.com/${REPO}/main/docs/daily-log/${LATEST_FILE}"
    else
      echo -e "${YELLOW}No daily logs found.${NC}"
    fi
    ;;
  search)
    QUERY="$2"
    if [ -z "$QUERY" ]; then
      echo -e "${YELLOW}Please provide a search keyword: daily-log search <keyword>${NC}"
      exit 1
    fi
    echo -e "${CYAN}==> Searching engineering notes for: '${QUERY}'...${NC}"
    curl -sSL "${API_BASE}/contents/docs/daily-log" | grep '"name"' | grep -i "$QUERY" | cut -d '"' -f 4 | while read -r line; do
      echo -e "  ${GREEN}•${NC} https://github.com/${REPO}/blob/main/docs/daily-log/${line}"
    done
    ;;
  categories)
    echo -e "${BOLD}${CYAN}Weekly Curriculum Disciplines:${NC}"
    echo -e "  ${BLUE}0. Sunday:${NC}    CI/CD & Observability (GitHub Actions, Prometheus, Grafana)"
    echo -e "  ${BLUE}1. Monday:${NC}    Docker & Linux Systems (Multi-stage, Distroless, Kernel sysctl)"
    echo -e "  ${BLUE}2. Tuesday:${NC}   Kubernetes & Cloud-Native (HPA, PDB, NetworkPolicies)"
    echo -e "  ${BLUE}3. Wednesday:${NC} Go & High-Concurrency (Goroutines, Channels, RWMutex)"
    echo -e "  ${BLUE}4. Thursday:${NC}  Python & FastAPI Architecture (AsyncIO, ASGI Middleware)"
    echo -e "  ${BLUE}5. Friday:${NC}    PostgreSQL & Redis Data Systems (Partial Indexing, TTL Locks)"
    echo -e "  ${BLUE}6. Saturday:${NC}  Terraform & Cloud IaC (Remote State, DynamoDB Locks)"
    ;;
  adrs)
    echo -e "${CYAN}==> Fetching Architecture Decision Records (ADRs)...${NC}"
    curl -sSL "${API_BASE}/contents/docs/adr" | grep '"name"' | grep '\.md"' | grep -v 'README' | cut -d '"' -f 4 | while read -r line; do
      echo -e "  ${MAGENTA}🏛️${NC} https://github.com/${REPO}/blob/main/docs/adr/${line}"
    done
    ;;
  version)
    echo -e "daily-log CLI ${GREEN}v1.0.0${NC} (Architecture & Cloud-Native Log Client)"
    ;;
  *)
    show_help
    ;;
esac
