#!/bin/bash
# Script to demonstrate the COBOL addition program

echo "=========================================="
echo "COBOL Addition Program Demonstration"
echo "=========================================="
echo ""

# Navigate to the repository root
cd "$(dirname "$0")"/..

echo "Step 1: Display original input file"
echo "-----------------------------------"
echo "File: data/numbers.txt"
cat data/numbers.txt
echo ""

echo "Step 2: Run the COBOL program"
echo "------------------------------"
./cobol/ADDNUM
echo ""

echo "Step 3: Display updated input file"
echo "-----------------------------------"
echo "File: data/numbers.txt"
cat data/numbers.txt
echo ""

echo "=========================================="
echo "Demonstration Complete!"
echo "=========================================="
