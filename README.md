# Bash Scripts Collection

This repository contains a collection of Bash scripts for various tasks, including hashing, encoding, and string manipulation


# How to Use

## Clone the Repository

```
git clone https://github.com/S1N15T3R/Bash-Scripts.git
```
## Change Directory to scripts

```
cd Bash-Scripts
```

## Navigate to the Scripts Directory

```
cd scripts
```

## Give the Permission 

```
chmod +x HASH_ED.sh
```
```
chmod +x add_string.sh
```


# Scripts

## 1. `HASH_ED.sh`

## Description
 A versatile Bash script to hash or encode-decode strings using various algorithms. It supports:
<ins>Hashing Algorithms</ins>
 **md5, sha1, sha224, sha256** 
**sha384, sha512, ripemd160, whirlpool**
<ins>Encoding/Decoding</ins>
** base64**

*Soon we'll be add other **Algorithm** and **Encoding/Decoding** method 🫣  

## Usage

## Encrypt a string with MD5

```
./scripts/HASH_ED.sh -e -a md5 -s "example_string"
```


## Encrypt a file's content with SHA256

```
./scripts/HASH_ED.sh -e -a sha256 -f input.txt -o output.txt
```

## Base64 encode a string

```
./scripts/HASH_ED.sh -e -a base64 -s "example_string"
```

## Base64 decode a string

```
./scripts/HASH_ED.sh -d -a base64 -s "ZXhhbXBsZV9zdHJpbmc="
```

## For further help about HASh_ED.sh

```
./HASH_ED.sh -h
```





# 2. add_string.sh

## Description
A versatile Bash script for string manipulation like prepend or append words to each line in a text file.

## Add "PREFIX_" before each line

```
./scripts/add_string.sh -f input.txt -w "PREFIX_" -b
```
## Add "_SUFFIX" after each line and save to output.txt
```
./scripts/add_string.sh -f input.txt -w "_SUFFIX" -a -o output.txt
```
## For further help about add_string.sh

```
./add_string.sh -h
```
