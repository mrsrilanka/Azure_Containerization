#!/bin/bash

# Function to remove tf stale/state files/directories and log the result
remove_file() {
    if rm -r "$1" 2>/dev/null; then
        echo "Removed: $1"
    else
        echo "Unable to remove: $1"
    fi
}

# Files and directories to remove
files_to_remove=(
    "terraform.tfstate"
    "terraform.tfstate.backup"
    ".terraform.lock.hcl"
    "tfplan"
    "tfplan.json"
    ".terraform"
)

# Remove each file/directory
for file in "${files_to_remove[@]}"; do
    remove_file "$file"
done

# Print a message indicating the script has finished running
echo "Cleanup process completed."
