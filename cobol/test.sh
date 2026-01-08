#!/bin/bash
# Test script for the COBOL addition program

cd "$(dirname "$0")"/..

# Backup the original data file
BACKUP_FILE="/tmp/numbers_backup_$$.txt"
cp data/numbers.txt "$BACKUP_FILE"

# Cleanup function
cleanup() {
    # Restore original data file
    if [ -f "$BACKUP_FILE" ]; then
        cp "$BACKUP_FILE" data/numbers.txt
        rm -f "$BACKUP_FILE"
    fi
}

# Set trap to ensure cleanup on exit
trap cleanup EXIT INT TERM

echo "Testing COBOL Addition Program"
echo "================================"
echo ""

# Test case 1
echo "Test 1: 123 + 456 = 579"
echo "00123 00456 000000" > data/numbers.txt
./cobol/ADDNUM > /dev/null 2>&1
RESULT=$(cat data/numbers.txt | awk '{print $3}')
if [ "$RESULT" = "000579" ]; then
    echo "✓ PASSED"
else
    echo "✗ FAILED (Expected: 000579, Got: $RESULT)"
fi
echo ""

# Test case 2
echo "Test 2: 999 + 1 = 1000"
echo "00999 00001 000000" > data/numbers.txt
./cobol/ADDNUM > /dev/null 2>&1
RESULT=$(cat data/numbers.txt | awk '{print $3}')
if [ "$RESULT" = "001000" ]; then
    echo "✓ PASSED"
else
    echo "✗ FAILED (Expected: 001000, Got: $RESULT)"
fi
echo ""

# Test case 3
echo "Test 3: 50000 + 25000 = 75000"
echo "50000 25000 000000" > data/numbers.txt
./cobol/ADDNUM > /dev/null 2>&1
RESULT=$(cat data/numbers.txt | awk '{print $3}')
if [ "$RESULT" = "075000" ]; then
    echo "✓ PASSED"
else
    echo "✗ FAILED (Expected: 075000, Got: $RESULT)"
fi
echo ""

# Test case 4
echo "Test 4: 0 + 0 = 0"
echo "00000 00000 000000" > data/numbers.txt
./cobol/ADDNUM > /dev/null 2>&1
RESULT=$(cat data/numbers.txt | awk '{print $3}')
if [ "$RESULT" = "000000" ]; then
    echo "✓ PASSED"
else
    echo "✗ FAILED (Expected: 000000, Got: $RESULT)"
fi
echo ""

echo "All tests completed!"
echo "Original data file restored."
