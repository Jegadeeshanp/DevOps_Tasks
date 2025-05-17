#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: $0 <input_file> <output_file>"
	exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"

if [ ! -f "$INPUT_FILE" ]; then
	echo "Error: $INPUT_FILE not found!"
	exit 1
fi

awk 'NR < 5 {
	print
	next
}
NR >= 5 {
	if ($0 ~ /welcome/) {
		gsub(/give/, "learning")
	}
	print
}' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Modified content written to $OUTPUT_FILE"
