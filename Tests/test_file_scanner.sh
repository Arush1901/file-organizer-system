#!/bin/bash

# Test script for file_scanner.sh

# Create a temporary test directory
TEST_DIR="test_scanner_directory"
mkdir -p $TEST_DIR

# Create sample files in the test directory
touch $TEST_DIR/file1.txt $TEST_DIR/file2.jpg $TEST_DIR/file3.mp4

echo "Running file_scanner.sh test..."

# Run the file_scanner script
../modules/file_scanner.sh $TEST_DIR

# Check if the script executed successfully
if [ $? -eq 0 ]; then
    echo "file_scanner.sh executed successfully."
else
    echo "file_scanner.sh failed."
fi

# Cleanup test directory
rm -rf $TEST_DIR
echo "Test completed and cleaned up."
