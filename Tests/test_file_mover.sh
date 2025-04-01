#!/bin/bash

# Test script for file_mover.sh

# Create a temporary test directory
TEST_DIR="test_mover_directory"
mkdir -p $TEST_DIR

# Create sample files with different extensions in the test directory
touch $TEST_DIR/document.docx $TEST_DIR/image.png $TEST_DIR/video.mp4

echo "Running file_mover.sh test..."

# Run the file_mover script
../modules/file_mover.sh $TEST_DIR

# Check if subdirectories were created and files were moved
if [ -d "$TEST_DIR/Documents" ] && [ -d "$TEST_DIR/Images" ] && [ -d "$TEST_DIR/Videos" ]; then
    echo "Subdirectories created successfully."
else
    echo "Subdirectories creation failed."
fi

if [ "$(ls -A $TEST_DIR/Documents)" ] && [ "$(ls -A $TEST_DIR/Images)" ] && [ "$(ls -A $TEST_DIR/Videos)" ]; then
    echo "Files moved successfully."
else
    echo "File movement failed."
fi

# Cleanup test directory
rm -rf $TEST_DIR
echo "Test completed and cleaned up."

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