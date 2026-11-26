#!/bin/bash
# Script 6: menu-driven script combining the previous tasks
DIR="$HOME/os_project"

# function: run a script only if it exists
run_script() {
  if [ -x "$DIR/$1" ]; then
    "$DIR/$1"
    echo "Exit status: $?"
  else
    echo "ERROR: $1 not found or not executable"
  fi
}

# safe delete: asks for confirmation, only inside the demo folder
safe_delete() {
  read -p "File name to delete (inside $DIR/demo): " name
  if [ -z "$name" ]; then
    echo "No name given."
    return 1
  fi
  target="$DIR/demo/$name"
  if [ ! -f "$target" ]; then
    echo "File not found: $target"
    return 1
  fi
  read -p "Delete $target ? (yes/no): " ans
  if [ "$ans" = "yes" ]; then
    rm -i "$target" && echo "Deleted."
  else
    echo "Cancelled."
  fi
}

while true; do
  echo ""
  echo "===== MENU ====="
  echo "1) Files management"
  echo "2) Search and text"
  echo "3) Permissions and users"
  echo "4) System info"
  echo "5) Backup"
  echo "6) Safe delete a file"
  echo "0) Exit"
  read -p "Choose: " choice
  case "$choice" in
    1) run_script 01_files.sh ;;
    2) run_script 02_search.sh ;;
    3) run_script 03_perms.sh ;;
    4) run_script 04_sysinfo.sh ;;
    5) run_script 05_backup.sh ;;
    6) safe_delete ;;
    0) echo "Bye"; exit 0 ;;
    *) echo "Invalid choice, try again." ;;
  esac
done
