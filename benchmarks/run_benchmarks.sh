#!/usr/bin/env bash
# Hardware-level Benchmark Runner for daily-engineering-log
set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}${CYAN}======================================================${NC}"
echo -e "${BOLD}${CYAN}   ⚡ Daily Engineering Concurrency Benchmark Suite  ${NC}"
echo -e "${BOLD}${CYAN}======================================================${NC}\n"

# 1. Python Benchmark
echo -e "${GREEN}==> Running Python 3.12+ AsyncIO TaskGroup Benchmark...${NC}"
python3 benchmarks/concurrency_benchmark.py
echo ""

# 2. Go Benchmark (if go exists)
if command -v go &> /dev/null; then
  echo -e "${GREEN}==> Running Go Goroutine Fan-Out & RWMutex Benchmarks...${NC}"
  go test -bench=. -benchmem ./benchmarks/
else
  echo -e "${CYAN}Go toolchain not detected in local path. (Executed in GitHub Actions runner)${NC}"
fi

echo -e "\n${GREEN}✅ All concurrency benchmarks executed successfully.${NC}"
