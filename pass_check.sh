#!/bin/bash

# Colors for UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Typing Animation Function
type_effect() {
    text="$1"
    delay="${2:-0.04}"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${text:$i:1}"
        sleep $delay
    done
    echo ""
}

clear

# Animated Header
echo -e "${BLUE}===========================================${NC}"
echo -ne "${CYAN}       ${NC}"
type_effect "PASSWORD STRENGTH CHECKER" 0.05
echo -e "${BLUE}===========================================${NC}"
echo ""

# Password hidden input
read -sp "Enter the password to test: " password
echo -e "\n"

length=${#password}
score=0

# Checking Criteria
if [ $length -ge 8 ]; then
    ((score+=20))
    len_check="${GREEN}✔ Length is 8+ characters ($length chars)${NC}"
else
    len_check="${RED}✘ Password is too short (Minimum 8 chars required)${NC}"
fi

if [[ "$password" =~ [A-Z] ]]; then
    ((score+=20))
    upper_check="${GREEN}✔ Contains Uppercase Letter (A-Z)${NC}"
else
    upper_check="${RED}✘ Missing Uppercase Letter${NC}"
fi

if [[ "$password" =~ [a-z] ]]; then
    ((score+=20))
    lower_check="${GREEN}✔ Contains Lowercase Letter (a-z)${NC}"
else
    lower_check="${RED}✘ Missing Lowercase Letter${NC}"
fi

if [[ "$password" =~ [0-9] ]]; then
    ((score+=20))
    num_check="${GREEN}✔ Contains Number (0-9)${NC}"
else
    num_check="${RED}✘ Missing Number${NC}"
fi

if [[ "$password" =~ [^a-zA-Z0-9] ]]; then
    ((score+=20))
    spec_check="${GREEN}✔ Contains Special Character (@, #, $, etc.)${NC}"
else
    spec_check="${RED}✘ Missing Special Character${NC}"
fi

# Output Results with subtle loading feel
echo -e "${BLUE}--- CHECKLIST ---${NC}"
sleep 0.2 && echo -e "$len_check"
sleep 0.2 && echo -e "$upper_check"
sleep 0.2 && echo -e "$lower_check"
sleep 0.2 && echo -e "$num_check"
sleep 0.2 && echo -e "$spec_check"
echo ""

# Strength Analysis
echo -n "Overall Strength: "
if [ $score -eq 100 ]; then
    echo -e "${GREEN}VERY STRONG ($score%)${NC}"
elif [ $score -ge 80 ]; then
    echo -e "${GREEN}STRONG ($score%)${NC}"
elif [ $score -ge 60 ]; then
    echo -e "${YELLOW}MODERATE ($score%)${NC}"
else
    echo -e "${RED}WEAK ($score%)${NC}"
fi
echo -e "${BLUE}===========================================${NC}"
