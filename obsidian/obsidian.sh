#!/bin/bash

LOG_DIR="$HOME/scripts/obs_logs"
LOG_FILE="$LOG_DIR/obsidian_git_sync.log"
VAULT_DIR="$HOME/Documents/Obsidian Vault"

# Ensure log directory exists
mkdir -p "$LOG_DIR"

# Navigate to your Obsidian vault directory
cd "$VAULT_DIR" || exit 1

# Add timestamp to log
echo "===== Sync started at $(date) =====" >> "$LOG_FILE"

# Pull latest changes from the remote repository
if ! git pull 2>> "$LOG_FILE"; then
    echo "Failed to pull from remote repository." >> "$LOG_FILE"
    exit 1
fi

# Add all new and changed files to git
git add . >> "$LOG_FILE" 2>&1

# Commit the changes with a timestamp. If there's nothing to commit, it's not an error
git commit -m "Update $(date)" >> "$LOG_FILE" 2>&1 || echo "No changes to commit" >> "$LOG_FILE"

# Push the changes to your git repository
if ! git push 2>> "$LOG_FILE"; then
    echo "Failed to push to remote repository." >> "$LOG_FILE"
    exit 1
fi

# Add end timestamp to log
echo "===== Sync completed at $(date) =====" >> "$LOG_FILE"
