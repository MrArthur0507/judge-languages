#!/bin/bash

# Temporary file to store the C source code
SOURCE_FILE="temp_source.c"

# Read from standard input and save to the temporary source file
cat > "$SOURCE_FILE"

# Define the output executable name
OUTPUT_FILE="temp_program"

# Compile the C program
gcc "$SOURCE_FILE" -o "$OUTPUT_FILE"

# Check if the compilation was successful
if [ $? -eq 0 ]; then
    # Use /usr/bin/time for a more detailed output
    { /usr/bin/time -v ./"$OUTPUT_FILE" > output.txt 2>&1; } 2> time_output.txt

    # Display execution details
    echo "Execution completed. Output is stored in output.txt."
    echo "Time and memory usage details are stored in time_output.txt."

    # Read and display the execution time and memory usage
    echo "Execution Time and Memory Usage:"
    cat time_output.txt
else
    echo "Compilation failed."
fi

# Clean up temporary files
rm "$SOURCE_FILE" "$OUTPUT_FILE" time_output.txt

