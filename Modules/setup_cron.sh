
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
