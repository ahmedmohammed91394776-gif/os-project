#!/bin/bash
# Script 1: directory and file management
BASE="$HOME/os_project/demo"

# create main dir and 3 subdirs (-p: no error if they exist)
mkdir -p "$BASE/docs" "$BASE/src" "$BASE/backup"

# create sample files
echo "hello" > "$BASE/docs/a.txt"
echo "world" > "$BASE/docs/b.txt"
touch "$BASE/src/test.tmp"

# copy, move, rename
cp "$BASE/docs/a.txt" "$BASE/src/"
mv "$BASE/docs/b.txt" "$BASE/backup/"
mv "$BASE/src/a.txt" "$BASE/src/renamed.txt"

# relative path example
cd "$BASE" && ls docs

# show structure
ls -R "$BASE"

# remove only the test file
if [ -f "$BASE/src/test.tmp" ]; then
  rm "$BASE/src/test.tmp"
  echo "test file removed"
else
  echo "test file not found"
fi
# my change
