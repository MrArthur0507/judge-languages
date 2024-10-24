#!/bin/sh

INPUT_FILE="/app/output_code.cs"  
OUTPUT_FILE="/app/output.txt"      
EXECUTABLE="/app/output_executable.exe"  

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' not found!"
  exit 1
fi

mcs -out:"$EXECUTABLE" "$INPUT_FILE" > "$OUTPUT_FILE" 2>&1

if [ $? -ne 0 ]; then
  echo "Compilation failed!"
  cat "$OUTPUT_FILE"
  exit 1
fi

mono "$EXECUTABLE" >> "$OUTPUT_FILE" 2>&1

if [ $? -ne 0 ]; then
  echo "Execution failed!"
  cat "$OUTPUT_FILE"
  exit 1
fi

cat "$OUTPUT_FILE"


