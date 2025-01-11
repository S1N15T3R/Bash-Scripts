# Bash Scripts Collection

This repository contains a collection of Bash scripts for various tasks, including hashing, encoding, and string manipulation


# How to Use

## Clone the Repository
```bash
git clone https://github.com/S1N15T3R/Bash-Scripts.git
```bash
## Change Directory to scripts
```bash
cd Bash-Scripts
```bash

## Navigate to the Scripts Directory
```bash
cd scripts
```bash

## Give the Permission 
```bash
chmod +x HASH_ED.sh
chmod +x add_string.sh
```bash




# Scripts

## 1. `HASH_ED.sh`

## Description
### A versatile Bash script to hash or encode strings using various algorithms (e.g., MD5, SHA256, Base64). It supports input from strings or files and allows specifying output files.

## Usage

## Encrypt a string with MD5
```bash
./scripts/HASH_ED.sh -e -a md5 -s "example_string"
```bash

## Encrypt a file's content with SHA256
```bash
./scripts/HASH_ED.sh -e -a sha256 -f input.txt -o output.txt
```bash

## Base64 encode a string
```bash
./scripts/HASH_ED.sh -e -a base64 -s "example_string"
```bash

## Base64 decode a string
```bash
./scripts/HASH_ED.sh -d -a base64 -s "ZXhhbXBsZV9zdHJpbmc="
```bash

## For further help
```bash
./HASH_ED.sh -h
```bash





### 2. 'add_string.sh'

#### Description
A versatile Bash script for string manipulation like prepend or append words to each line in a text file.

# Add "PREFIX_" before each line
./scripts/add_string.sh -f input.txt -w "PREFIX_" -b

# Add "_SUFFIX" after each line and save to output.txt
./scripts/add_string.sh -f input.txt -w "_SUFFIX" -a -o output.txt

# For further help
./add_string.sh -h

