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
fo_create_sepolia() {
    hea1 "Zksync Deploy"

    LOG_FILE="logs/deploy_create_sepolia.log"
    mkdir -p logs

    rpz="https://zksync-sepolia.g.alchemy.com/v2/YfG5-esHajH3FpsLvC4eMFMEFYl9Lqcg"
    keyz1="0x6890220d6cc0218032cab963a528672d85643a2c7edf340de6e27861d1900958"

    echo -e "~~~~ZK ERA SEPOLI DEPLOY~~~~~"
    echo -e "~~~~ZK ERA SEPOLI DEPLOY~~~~~"
    echo -e "~~~~ZK ERA SEPOLI DEPLOY~~~~~"
    echo -e "~~~~ZK ERA SEPOLI DEPLOY~~~~~"

    CO1="forge create ${CONTRACT_PATH_CREATE} \
        --rpc-url ${rpz} \
        --private-key ${keyz1} \
        --optimize true \
        --optimizer-runs 999\
        --build-info --build-info-path outz/ \
        --etherscan-api-key ${ETHERSCAN_API_KEY} \
        --verify --broadcast \
        --out outz/"

    echo -e "${BLUE}Running: $CO1${NC}"

    # Run and log to file
    eval "$CO1" 2>&1 | tee "$LOG_FILE"

    echo -e "${GREEN}Successfully deployed contract${NC}"
    echo -e "${YELLOW}Log saved to $LOG_FILE${NC}"
}

# Execution
build_zk
