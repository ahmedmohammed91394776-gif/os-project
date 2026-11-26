#!/bin/bash
# Script 5: backup and restore
SRC="${1:-$HOME/os_project/demo}"
DEST="$HOME/os_project/backups"
STAMP=$(date +%Y%m%d_%H%M%S)
FILE="$DEST/backup_$STAMP.tar.gz"

# handle missing source
if [ ! -d "$SRC" ]; then
  echo "ERROR: source directory $SRC not found"
  exit 1
fi

mkdir -p "$DEST"

# backup with tar (date in name so runs don't overwrite)
if tar -czf "$FILE" -C "$(dirname "$SRC")" "$(basename "$SRC")"; then
  echo "SUCCESS: backup created: $FILE"
else
  echo "FAILED: backup did not complete"
  exit 1
fi

# list contents of the backup
tar -tzf "$FILE"

# restore into a separate test folder
RESTORE="$HOME/os_project/restored_$STAMP"
mkdir -p "$RESTORE"
tar -xzf "$FILE" -C "$RESTORE"
echo "Restored to: $RESTORE"
ls -R "$RESTORE"
