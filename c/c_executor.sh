#!/bin/sh

INPUT_FILE="/app/output_code.c"  # Update to use /app directory
OUTPUT_BINARY="/app/program.out"   # Update to use /app directory
OUTPUT_FILE="/app/output.txt"       # Update to use /app directory

if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' not found!"
  exit 1
fi

# Compile the C program
gcc "$INPUT_FILE" -o "$OUTPUT_BINARY"
if [ $? -ne 0 ]; then
  echo "Compilation failed!"
  exit 1
fi

# Ensure the binary is executable
chmod +x "$OUTPUT_BINARY"

echo "Compilation successful. Running the program..."

# Execute the program using the absolute path
timeout 5 "$OUTPUT_BINARY" > "$OUTPUT_FILE" 2>&1

# Display the output from the program
cat "$OUTPUT_FILE"

# Optional: remove the output binary after execution
# rm "$OUTPUT_BINARY"

