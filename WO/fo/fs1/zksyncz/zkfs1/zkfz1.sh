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

# Installaz

install_zksync() {
    h1 "Install Zksync"
    CO1="curl -L https://raw.githubusercontent.com/matter-labs/foundry-zksync/main/install-foundry-zksync | bash"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    eval "$CO1"
}

# building for zksync
build_zk() {
    h1 "Building Forge Zksync Project"

    # Setup Logs Directory
    mkdir -p logs
    LOG_FILE="logs/build_zk.log"

    # Execute Build
    CO1="forge build --zksync -vvvvv"
    echo -e "${GREEN}Command: ${NC}${CO1}"
    eval "$CO1" 2>&1 | tee "$LOG_FILE"
}

# Deploy Zkysnc
deploy_zk() {

}

# Execution
build_zk
