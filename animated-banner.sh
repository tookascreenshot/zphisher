#!/bin/bash

# Animated ZPHISHER Banner
# Author: MUZAMIL

# Colors
RED="\033[31m"
GREEN="\033[32m"
ORANGE="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

# Clear screen
clear

# Animation frames
frame1() {
    echo -e "${ORANGE}"
    echo " __  __  __  __  ____    __    __  __  ____  __     "
    echo "(  \/  )(  )(  )(_   )  /__\  (  \/  )(_  _)(  )    "
    echo " )    (  )(__)(  / /_  /(__)\  )    (  _)(_  )(__   "
    echo "(_/\/\_)(______)(____)(__)(__)(_/\/\_)(____)(____)  "
    echo -e "${CYAN}════════════════════════════════════════════════════════════════════"
    echo -e "${WHITE}                    ${RED}Version : 2.3.5 ${WHITE}| ${GREEN}Author : MUZAMIL${WHITE}"
    echo ""
}

frame2() {
    echo -e "${MAGENTA}"
    echo " __  __  __  __  ____    __    __  __  ____  __     "
    echo "(  \/  )(  )(  )(_   )  /__\  (  \/  )(_  _)(  )    "
    echo " )    (  )(__)(  / /_  /(__)\  )    (  _)(_  )(__   "
    echo "(_/\/\_)(______)(____)(__)(__)(_/\/\_)(____)(____)  "
    echo -e "${BLUE}════════════════════════════════════════════════════════════════════"
    echo -e "${WHITE}                    ${RED}Version : 2.3.5 ${WHITE}| ${GREEN}Author : MUZAMIL${WHITE}"
    echo ""
}

frame3() {
    echo -e "${GREEN}"
    echo " __  __  __  __  ____    __    __  __  ____  __     "
    echo "(  \/  )(  )(  )(_   )  /__\  (  \/  )(_  _)(  )    "
    echo " )    (  )(__)(  / /_  /(__)\  )    (  _)(_  )(__   "
    echo "(_/\/\_)(______)(____)(__)(__)(_/\/\_)(____)(____)  "
    echo -e "${RED}════════════════════════════════════════════════════════════════════"
    echo -e "${WHITE}                    ${RED}Version : 2.3.5 ${WHITE}| ${GREEN}Author : MUZAMIL${WHITE}"
    echo ""
}

# Animation loop
for i in {1..10}; do
    frame1
    sleep 0.5
    clear
    
    frame2
    sleep 0.5
    clear
    
    frame3
    sleep 0.5
    clear
done

# Final frame
frame1
echo -e "${GREEN}[${WHITE}+${GREEN}]${CYAN} Animation Complete!${WHITE}"