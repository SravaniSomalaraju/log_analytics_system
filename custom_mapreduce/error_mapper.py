#!/usr/bin/env python3
import sys
import re

# Regex for common web log format
log_pattern = re.compile(r'"\S+\s\S+\s\S+"\s(\d{3})')

for line in sys.stdin:
    match = log_pattern.search(line)

    if not match:
        continue

    status_code = int(match.group(1))

    if status_code >= 400:
        print(f"{status_code}\t1")
