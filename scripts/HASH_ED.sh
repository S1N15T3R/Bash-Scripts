#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 [-e|-d] -a algorithm [-f input_file] [-s input_string] [-o output_file]"
    echo "Options:"
    echo "  -e                 Encrypt/hash/encode the input"
    echo "  -d                 Decode (only for Base64)"
    echo "  -a algorithm       Algorithm (e.g., md5, sha256, base64)"
    echo "  -f input_file      Input file containing strings to process"
    echo "  -s input_string    Input string to process"
    echo "  -o output_file     Output file to save results (optional)"
    exit 1
}

# Check if no arguments were passed
if [ $# -eq 0 ]; then
    usage
fi

# Initialize variables
ACTION=""
ALGORITHM=""
INPUT_FILE=""
INPUT_STRING=""
OUTPUT_FILE=""

# Parse command-line arguments
while getopts "eda:f:s:o:" opt; do
    case "$opt" in
        e) ACTION="encrypt" ;;
        d) ACTION="decrypt" ;;
        a) ALGORITHM="$OPTARG" ;;
        f) INPUT_FILE="$OPTARG" ;;
        s) INPUT_STRING="$OPTARG" ;;
        o) OUTPUT_FILE="$OPTARG" ;;
        *) usage ;;
    esac
done

# Ensure required options are provided
if [[ -z "$ACTION" || -z "$ALGORITHM" ]]; then
    echo "Error: -e or -d and -a options are required."
    usage
fi

# Handle Base64 decryption case
if [[ "$ACTION" == "decrypt" && "$ALGORITHM" != "base64" ]]; then
    echo "Error: Decryption is only supported for Base64."
    exit 1
fi

# Function to hash or encode input
process_input() {
    local input="$1"
    local algo="$2"

    case "$algo" in
        md5|sha1|sha224|sha256|sha384|sha512|ripemd160|whirlpool)
            echo -n "$input" | openssl dgst -"$algo" | awk '{print $2}'
            ;;
        base64)
            if [[ "$ACTION" == "encrypt" ]]; then
                echo -n "$input" | base64
            else
                echo -n "$input" | base64 --decode
            fi
            ;;
        *)
            echo "Error: Unsupported algorithm $algo."
            exit 1
            ;;
    esac
}

# Process input
if [[ -n "$INPUT_FILE" ]]; then
    # Process file input
    if [[ ! -f "$INPUT_FILE" ]]; then
        echo "Error: File $INPUT_FILE not found."
        exit 1
    fi
    while IFS= read -r line; do
        if [[ -n "$line" ]]; then
            result=$(process_input "$line" "$ALGORITHM")
            if [[ -n "$OUTPUT_FILE" ]]; then
                echo "$result" >> "$OUTPUT_FILE"
            else
                echo "$result"
            fi
        fi
    done < "$INPUT_FILE"
elif [[ -n "$INPUT_STRING" ]]; then
    # Process string input
    result=$(process_input "$INPUT_STRING" "$ALGORITHM")
    if [[ -n "$OUTPUT_FILE" ]]; then
        echo "$result" > "$OUTPUT_FILE"
    else
        echo "$result"
    fi
else
    echo "Error: Either -f or -s option is required."
    usage
fi

echo "Operation completed successfully."
