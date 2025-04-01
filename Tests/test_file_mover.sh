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
