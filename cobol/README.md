# COBOL Addition Program

## Overview
This COBOL program reads two numbers from an input file, adds them together, and writes the result back into the same input file.

## Program Details

### File: `cobol/ADDNUM.cbl`
The COBOL program performs the following operations:
1. Opens the input file in I-O (Input-Output) mode
2. Reads the first record containing two numbers
3. Adds the two numbers together
4. Writes the sum back to the third field in the same record
5. Displays the operation results
6. Closes the file

### Input File Format
The input file (`data/numbers.txt`) has the following format:
- **NUM1**: 5 digits (positions 1-5)
- **SPACE**: 1 character (position 6)
- **NUM2**: 5 digits (positions 7-11)
- **SPACE**: 1 character (position 12)
- **SUM**: 6 digits (positions 13-18) - This will be updated by the program

Example:
```
00123 00456 000000
```

After running the program, the file will be updated to:
```
00123 00456 000579
```

## Prerequisites

To compile and run this COBOL program, you need a COBOL compiler. The most common options are:

### Option 1: GnuCOBOL (Free and Open Source)
```bash
# On Ubuntu/Debian
sudo apt-get update
sudo apt-get install gnucobol

# On macOS
brew install gnucobol

# On Windows (using MinGW or Cygwin)
# Download from: https://gnucobol.sourceforge.io/
```

### Option 2: Other COBOL Compilers
- IBM Enterprise COBOL
- Micro Focus COBOL
- Fujitsu COBOL

## How to Compile and Run

### Using GnuCOBOL

1. **Navigate to the repository root:**
   ```bash
   cd /path/to/skills-scale-institutional-knowledge-using-copilot-spaces
   ```

2. **Compile the COBOL program:**
   ```bash
   cobc -x -o cobol/ADDNUM cobol/ADDNUM.cbl
   ```
   
   Options explained:
   - `-x`: Create an executable program
   - `-o`: Specify output file name
   - `cobol/ADDNUM.cbl`: Source file

3. **Run the program:**
   ```bash
   ./cobol/ADDNUM
   ```

4. **View the updated file:**
   ```bash
   cat data/numbers.txt
   ```

## Sample Execution

### Before Execution:
```
$ cat data/numbers.txt
00123 00456 000000
```

### Running the Program:
```
$ ./cobol/ADDNUM
NUM1: 00123
NUM2: 00456
SUM:  000579
RECORD UPDATED SUCCESSFULLY
```

### After Execution:
```
$ cat data/numbers.txt
00123 00456 000579
```

## Modifying the Input Data

To test with different numbers, edit the `data/numbers.txt` file:
1. Ensure NUM1 is exactly 5 digits
2. Add a space
3. Ensure NUM2 is exactly 5 digits
4. Add a space
5. Add 6 digits for the sum field (will be overwritten)

Example:
```
00999 00001 000000
```

This will calculate: 999 + 1 = 1000

## Error Handling

The program includes error handling for:
- File not found or cannot be opened
- Empty file (no data to read)
- File write errors

If any error occurs, an appropriate error message will be displayed with the file status code.

## Technical Notes

- The program uses **SEQUENTIAL** organization, which allows I-O operations and record rewrites
- The file is opened in **I-O mode** to allow both reading and writing
- The **REWRITE** statement updates the current record in place
- File status codes are checked after each I/O operation for error handling

## File Structure

```
.
├── cobol/
│   └── ADDNUM.cbl       # COBOL source code
├── data/
│   └── numbers.txt      # Input/Output data file
└── cobol/README.md      # This file
```

## Common Issues and Solutions

### Issue: "cobc: command not found"
**Solution**: Install GnuCOBOL using the instructions in the Prerequisites section.

### Issue: "File not found" error when running the program
**Solution**: Ensure you're running the program from the repository root directory, or update the file path in the COBOL source code.

### Issue: Numbers are not formatted correctly
**Solution**: Ensure all numbers are zero-padded to the correct length (5 digits for inputs, 6 for sum).

## License
This program is part of the skills-scale-institutional-knowledge-using-copilot-spaces repository and follows the same license (MIT).
