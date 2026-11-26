#!/bin/bash
# Script 2: searching and text processing
DIR="$HOME/os_project/search_demo"
REPORT="$DIR/report.log"
mkdir -p "$DIR"

# create sample files
printf "apple\nbanana\napple\ncherry\nbanana\napple\n" > "$DIR/fruits.txt"
printf "linux is fun\nbash scripts are useful\nlinux commands\n" > "$DIR/notes.txt"
echo "no match here" > "$DIR/other.log"

echo "== Search report ==" > "$REPORT"

# find files by extension
echo "-- .txt files:" >> "$REPORT"
find "$DIR" -name "*.txt" >> "$REPORT"

# grep: lines containing the word linux
echo "-- lines with 'linux':" >> "$REPORT"
grep -r "linux" "$DIR" --include="*.txt" >> "$REPORT"

# head and tail
echo "-- first 2 lines of fruits:" >> "$REPORT"
head -n 2 "$DIR/fruits.txt" >> "$REPORT"
echo "-- last 2 lines of fruits:" >> "$REPORT"
tail -n 2 "$DIR/fruits.txt" >> "$REPORT"

# pipe: sort, count duplicates
echo "-- fruit counts:" >> "$REPORT"
sort "$DIR/fruits.txt" | uniq -c >> "$REPORT"

# wc: count lines and files
echo "-- lines in fruits.txt: $(wc -l < "$DIR/fruits.txt")" >> "$REPORT"
echo "-- number of .txt files: $(find "$DIR" -name '*.txt' | wc -l)" >> "$REPORT"

cat "$REPORT"
