#!/bin/bash
# Script 3: permissions and user/group info (safe test dir only)
DIR="$HOME/os_project/perm_demo"
mkdir -p "$DIR/testdir"
echo "secret" > "$DIR/test.txt"

echo "== Permissions before =="
ls -l "$DIR/test.txt"

# chmod: owner rw, group r, others none
chmod 640 "$DIR/test.txt"
echo "== After chmod 640 =="
ls -l "$DIR/test.txt"

# chmod symbolic: add execute for owner
chmod u+x "$DIR/test.txt"
echo "== After chmod u+x =="
ls -l "$DIR/test.txt"

# chmod on a directory
chmod 755 "$DIR/testdir"
ls -ld "$DIR/testdir"

echo "== User and group info =="
echo "User: $(whoami)"
id
echo "Groups: $(groups)"
echo "First lines of /etc/passwd (read only):"
head -n 3 /etc/passwd
