# Bash Scripts Collection

This repository contains a collection of Bash scripts for various tasks, including hashing, encoding, and string manip>

## Scripts

### 1. `HASH_ED.sh`

#### Description
A versatile Bash script to hash or encode strings using various algorithms (e.g., MD5, SHA256, Base64). It supports in>

#### Usage
```bash
# Encrypt a string with MD5
./scripts/HASH_ED.sh -e -a md5 -s "example_string"

# Encrypt a file's content with SHA256
./scripts/HASH_ED.sh -e -a sha256 -f input.txt -o output.txt

# Base64 encode a string
./scripts/HASH_ED.sh -e -a base64 -s "example_string"

# Base64 decode a string
./scripts/HASH_ED.sh -d -a base64 -s "ZXhhbXBsZV9zdHJpbmc="

# For further help
./HASH_ED.sh -h





### 2. 'add_string.sh'

#### Description
A versatile Bash script for string manipulation like prepend or append words to each line in a text file.

# Add "PREFIX_" before each line
./scripts/add_string.sh -f input.txt -w "PREFIX_" -b

# Add "_SUFFIX" after each line and save to output.txt
./scripts/add_string.sh -f input.txt -w "_SUFFIX" -a -o output.txt

# For further help
./add_string.sh -h

