#!/bin/sh


INPUT_FILE="output_code.c"


OUTPUT_BINARY="program.out"


OUTPUT_FILE="output.txt"


if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: Input file '$INPUT_FILE' not found!"
  exit 1
fi

gcc "$INPUT_FILE" -o "$OUTPUT_BINARY"
if [ $? -ne 0 ]; then
  echo "Compilation failed!"
  exit 1
fi


echo "Compilation successful. Running the program..."
./"$OUTPUT_BINARY" > "$OUTPUT_FILE" 2>&1


cat "$OUTPUT_FILE"


# rm "$OUTPUT_BINARY"


