#!/usr/bin/bash
# UTility Functions Mentioned in the course

clear

# Colors
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[0;37m'
export NC='\033[0m' # No Color

# Commands

h1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

# Functions

# Cast function to convert hex to decimal
ca1() {
    h1 "cast convert hexadecimal to function"
    TO_CONVERT="0xac468"
    CO1="cast --to-base ${TO_CONVERT} --to-decimal"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    echo -e "${GREEN}Output: ${NC}"
    RESULT=(eval "$CO1")
    echo -e "${GREEN}${TO_CONVERT} to decimal =$RESULT"
}

# Execution
ca1
