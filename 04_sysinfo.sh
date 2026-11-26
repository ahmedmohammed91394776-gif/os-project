#!/bin/bash
# Script 4: system information report
REPORT="$HOME/os_project/system_report.log"

{
  echo "== System report =="
  echo "User: $(whoami)"
  echo "Date: $(date)"
  echo "Hostname: $(hostname)"
  echo "Current dir: $(pwd)"
  echo "-- Disk usage (df):"
  df -h /
  echo "-- Memory (free):"
  free -h
  echo "-- Top 5 processes (ps):"
  ps aux | head -n 6
} > "$REPORT"

cat "$REPORT"
echo "Report saved to $REPORT"
