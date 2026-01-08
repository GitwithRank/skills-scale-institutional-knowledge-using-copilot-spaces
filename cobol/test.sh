#!/bin/bash
# Test script for the COBOL addition program

cd "$(dirname "$0")"/..

echo "Testing COBOL Addition Program"
echo "================================"
echo ""

# Test case 1
echo "Test 1: 123 + 456 = 579"
echo "00123 00456 000000" > data/numbers.txt
./cobol/ADDNUM > /tmp/test1.log 2>&1
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
./cobol/ADDNUM > /tmp/test2.log 2>&1
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
./cobol/ADDNUM > /tmp/test3.log 2>&1
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
./cobol/ADDNUM > /tmp/test4.log 2>&1
RESULT=$(cat data/numbers.txt | awk '{print $3}')
if [ "$RESULT" = "000000" ]; then
    echo "✓ PASSED"
else
    echo "✗ FAILED (Expected: 000000, Got: $RESULT)"
fi
echo ""

# Reset to example data
echo "Resetting to example data..."
echo "00123 00456 000000" > data/numbers.txt
echo ""
echo "All tests completed!"
