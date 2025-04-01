#!/bin/bash

# Script to organize files into subdirectories based on their extensions
# Usage: ./file_mover.sh /path/to/directory

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi

echo "Organizing files in directory: $DIRECTORY"

# Define subdirectories for file types
declare -A FILE_TYPES=(
    ["Documents"]="doc docx pdf txt"
    ["Images"]="jpg jpeg png gif bmp"
    ["Videos"]="mp4 avi mkv mov"
)

# Create subdirectories if they don't exist
for SUBDIR in "${!FILE_TYPES[@]}"; do
    mkdir -p "$DIRECTORY/$SUBDIR"
done

# Move files based on their extensions
find "$DIRECTORY" -type f | while read -r FILE; do
    EXT="${FILE##*.}"
    for SUBDIR in "${!FILE_TYPES[@]}"; do
        if [[ "${FILE_TYPES[$SUBDIR]}" =~ (^|[[:space:]])"$EXT"($|[[:space:]]) ]]; then
            mv "$FILE" "$DIRECTORY/$SUBDIR/"
            echo "Moved '$FILE' to '$SUBDIR/'"
            break
        fi
    done
done

echo "File organization complete."

#!/bin/bash

# Script to set up a cron job for automating file organization
# Usage: ./setup_cron.sh /path/to/directory

if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

DIRECTORY=$1

if [ ! -d "$DIRECTORY" ]; then
    echo "Error: Directory '$DIRECTORY' does not exist."
    exit 1
fi

SCRIPT_PATH=$(realpath "$(dirname "$0")/file_mover.sh")

# Check if cron is installed and running
if ! command -v crontab &> /dev/null; then
    echo "Error: Cron is not installed."
    exit 1
fi

# Add cron job (runs every hour)
CRON_JOB="0 * * * * $SCRIPT_PATH $DIRECTORY"
(crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -

echo "Cron job added successfully:"
echo "$CRON_JOB"

echo "You can verify the cron job using 'crontab -l'."