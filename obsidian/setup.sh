#!/bin/bash

# Function to ask for directory on macOS
ask_directory_mac() {
    osascript -e 'tell app "Finder" to return the POSIX path of (choose folder with prompt "'"$1"'")'
}

# Function to ask for directory on Linux
ask_directory_linux() {
    zenity --file-selection --directory --title="$1"
}

# Detect the operating system
OS="`uname`"
case $OS in
  'Linux')
    LOG_DIR=$(ask_directory_linux "Select your log directory")
    VAULT_DIR=$(ask_directory_linux "Select your Obsidian vault directory")
    ;;
  'Darwin') 
    LOG_DIR=$(ask_directory_mac "Select your log directory")
    VAULT_DIR=$(ask_directory_mac "Select your Obsidian vault directory")
    ;;
  *) 
    echo "Unsupported OS"
    exit 1
    ;;
esac

# Check if the directories were selected
if [ -z "$LOG_DIR" ] || [ -z "$VAULT_DIR" ]; then
    echo "Directory selection was cancelled."
    exit 1
fi

# The path to your obsidian.sh script
OBSIDIAN_SH="obsidian.sh"

# Backup the original obsidian.sh script
cp "$OBSIDIAN_SH" "$OBSIDIAN_SH.bak"

# Remove existing LOG_DIR, LOG_FILE, and VAULT_DIR lines
sed -i'.tmp' -e '/^LOG_DIR/d' -e '/^LOG_FILE/d' -e '/^VAULT_DIR/d' "$OBSIDIAN_SH"

# Insert the new variable definitions after the shebang
sed -i'.tmp' -e "1a\\
LOG_DIR=\"$LOG_DIR\"\\
LOG_FILE=\"\$LOG_DIR/obsidian_git_sync.log\"\\
VAULT_DIR=\"$VAULT_DIR\"\\
" "$OBSIDIAN_SH"

# Remove the temporary file created by sed on macOS, not needed on Linux
[ "$OS" = "Darwin" ] && rm "${OBSIDIAN_SH}.tmp"

echo "Setup complete. The variables in $OBSIDIAN_SH have been updated."
