#!/bin/bash

# Check if a file path is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
  echo "File not found!"
  exit 1
fi

# Read the first character of the file
first_char=$(head -c 1 "$file")

if [ "$first_char" == "#" ]; then
  # Remove the first character if it is #
  tail -c +2 "$file" > temp_file && mv temp_file "$file"
else
  # Add # as the first character
  echo "#$(cat "$file")" > temp_file && mv temp_file "$file"
fi
