#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -f input_file -w word [-b|-a] [-o output_file]"
    echo "Options:"
    echo "  -f input_file      Input file containing the list of strings"
    echo "  -w word            Word to add"
    echo "  -b                 Add the word before each line"
    echo "  -a                 Add the word after each line"
    echo "  -o output_file     Output file to save the results (optional)"
    exit 1
}

# Check if no arguments were passed
if [ $# -eq 0 ]; then
    usage
fi

# Initialize variables
INPUT_FILE=""
WORD=""
POSITION=""
OUTPUT_FILE=""

# Parse command-line arguments
while getopts "f:w:bao:" opt; do
    case "$opt" in
        f) INPUT_FILE="$OPTARG" ;;
        w) WORD="$OPTARG" ;;
        b) POSITION="before" ;;
        a) POSITION="after" ;;
        o) OUTPUT_FILE="$OPTARG" ;;
        *) usage ;;
    esac
done

# Ensure required options are provided
if [[ -z "$INPUT_FILE" || -z "$WORD" || -z "$POSITION" ]]; then
    echo "Error: -f, -w, and either -b or -a options are required."
    usage
fi

# Check if input file exists
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Error: File $INPUT_FILE not found."
    exit 1
fi

# Process the input file
if [[ -n "$OUTPUT_FILE" ]]; then
    > "$OUTPUT_FILE"  # Clear or create the output file
fi

while IFS= read -r line; do
    if [[ -n "$line" ]]; then
        if [[ "$POSITION" == "before" ]]; then
            result="$WORD$line"
        elif [[ "$POSITION" == "after" ]]; then
            result="$line$WORD"
        fi

        # Output the result
        if [[ -n "$OUTPUT_FILE" ]]; then
            echo "$result" >> "$OUTPUT_FILE"
        else
            echo "$result"
        fi
    fi
done < "$INPUT_FILE"

echo "Operation completed successfully."
