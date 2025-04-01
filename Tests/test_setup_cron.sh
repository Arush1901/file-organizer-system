
#!/bin/bash

# Test script for setup_cron.sh

# Create a temporary test directory
TEST_DIR="test_cron_directory"
mkdir -p $TEST_DIR

echo "Running setup_cron.sh test..."

# Run the setup_cron script with the test directory path
../modules/setup_cron.sh $TEST_DIR

# Verify if the cron job was added successfully
CRON_JOB=$(crontab -l | grep "../modules/file_mover.sh")
if [ -n "$CRON_JOB" ]; then
    echo "Cron job added successfully: $CRON_JOB"
else
    echo "Failed to add cron job."
fi

# Cleanup cron job (optional)
crontab -r
rm -rf $TEST_DIR
echo "Test completed and cleaned up."
