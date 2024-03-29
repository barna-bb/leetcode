#!/bin/bash

# Check argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <problem_number>"
    exit 1
fi

# Extract problem number
problem_number=$1

# Validate problem number
if ! [[ $problem_number =~ ^[1-9][0-9]{0,3}$ ]]; then
    echo "Invalid problem number. Please provide a number between 1 and 9999."
    exit 1
fi

# Pad with leading zeros
padded_number=$(printf "%04d" $problem_number)

# Create file name
filename="p${padded_number}.md"

# Check if exists
if [ -e "$filename" ]; then
    echo "File $filename already exists."
    exit 1
fi

# Create file with title
{
    echo "# Problem $problem_number" 
    echo
    echo "## Approach"
    echo
    echo
    echo "## Code"
    echo
    echo '```cpp'
    echo
    echo '```'
} > "$filename"

echo "Created $filename successfully."
