#!/bin/bash

# Muzamil - One Click Installer
# Author: MUZAMIL
# Version: 2.3.5

# Colors
RED="\033[31m"
GREEN="\033[32m"
ORANGE="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

# Banner
echo -e "${ORANGE}"
echo " __  __  __  __  ____    __    __  __  ____  __     "
echo "(  \/  )(  )(  )(_   )  /__\  (  \/  )(_  _)(  )    "
echo " )    (  )(__)(  / /_  /(__)\  )    (  _)(_  )(__   "
echo "(_/\/\_)(______)(____)(__)(__)(_/\/\_)(____)(____)  "
echo -e "${CYAN}════════════════════════════════════════════════════════════════════"
echo -e "${WHITE}                    ${RED}Version : 2.3.5 ${WHITE}| ${GREEN}Author : MUZAMIL${WHITE}"
echo -e "${GREEN}[${WHITE}-${GREEN}]${CYAN} One-Click Installer for Muzamil Tool${WHITE}"
echo ""

# Check if running as root
if [[ $EUID -eq 0 ]]; then
   echo -e "${RED}[${WHITE}!${RED}]${RED} This script should not be run as root!${WHITE}"
   exit 1
fi

# Update system
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Updating system packages...${WHITE}"
if command -v apt &> /dev/null; then
    sudo apt update -y
elif command -v pacman &> /dev/null; then
    sudo pacman -Sy --noconfirm
elif command -v dnf &> /dev/null; then
    sudo dnf update -y
fi

# Install dependencies
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing dependencies...${WHITE}"
if command -v apt &> /dev/null; then
    sudo apt install -y git curl wget php unzip
elif command -v pacman &> /dev/null; then
    sudo pacman -S --noconfirm git curl wget php unzip
elif command -v dnf &> /dev/null; then
    sudo dnf install -y git curl wget php unzip
fi

# Clone repository
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Cloning Muzamil repository...${WHITE}"
if [[ -d "muzamil" ]]; then
    rm -rf muzamil
fi
git clone https://github.com/muzamil-tech/muzamil.git
cd muzamil

# Make executable
chmod +x muzamil.sh
chmod +x muzamil

# Create symlink
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Creating system-wide command...${WHITE}"
sudo ln -sf "$(pwd)/muzamil" /usr/local/bin/muzamil
sudo ln -sf "$(pwd)/muzamil.sh" /usr/local/bin/muzamil.sh

# Install completion
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Setting up command completion...${WHITE}"
if [[ -f ~/.bashrc ]]; then
    echo 'alias mz="muzamil"' >> ~/.bashrc
    echo 'alias muzamil="bash muzamil.sh"' >> ~/.bashrc
fi

if [[ -f ~/.zshrc ]]; then
    echo 'alias mz="muzamil"' >> ~/.zshrc
    echo 'alias muzamil="bash muzamil.sh"' >> ~/.zshrc
fi

# Success message
echo ""
echo -e "${GREEN}════════════════════════════════════════════════════════════════════${WHITE}"
echo -e "${GREEN}[${WHITE}✓${GREEN}]${GREEN} Muzamil has been successfully installed!${WHITE}"
echo ""
echo -e "${CYAN}Usage:${WHITE}"
echo -e "${WHITE}  muzamil    - Run the tool${WHITE}"
echo -e "${WHITE}  mz         - Short command${WHITE}"
echo -e "${WHITE}  muzamil.sh - Direct script${WHITE}"
echo ""
echo -e "${CYAN}Directory:${WHITE} $(pwd)"
echo -e "${CYAN}Commands:${WHITE}"
echo -e "${WHITE}  cd $(pwd)${WHITE}"
echo -e "${WHITE}  ./muzamil${WHITE}"
echo ""
echo -e "${RED}[${WHITE}!${RED}]${ORANGE} Remember: This tool is for educational purposes only!${WHITE}"
echo -e "${GREEN}════════════════════════════════════════════════════════════════════${WHITE}"