#!/bin/bash

# Script to scan a directory and list all files
# Usage: ./file_scanner.sh /path/to/directory

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi

echo "Scanning directory: $DIRECTORY"
find "$DIRECTORY" -type f | while read -r FILE; do
    echo "Found file: $FILE"
done

echo "Scan complete."
