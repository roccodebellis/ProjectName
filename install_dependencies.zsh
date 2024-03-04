#!/bin/zsh

# ANSI color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RESET='\033[0m' # Reset color

# Script to run 'make system_dependencies'

# Check if make is installed
if ! command -v make &> /dev/null
then
    echo "${RED}Make not found. Make sure it is installed.${RESET}"
    exit 1
fi

# Run the 'make system_dependencies' command
echo "⚙️  ${YELLOW}Running 'make system_dependencies'...${RESET}"
make system_dependencies && echo "⚙️  ${GREEN}Dependencies installed successfully.${RESET}"