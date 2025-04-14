#!/usr/bin/bash
# This bash srcript is for making cast accounts
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

hea1() {
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"
}

cwb() {
    hea1 "Balance Checker"

    # --- Configuration ---
    # Wallet Addresses
    local -a wallets=(
        "0x2ce40e5d9BC00dA5f397690E83E88183c4d4b23F"
        "0x5508D7e21f7B096481AfCc9bA2e2a405Be96b878"
        "0x2C1381655097598Bae22c5326b0F3B43220a18c4"
    )

    # Network Configurations (Format: "NetworkName:RPC_URL")
    local -a networks=(
        "Sepolia:https://eth-sepolia.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
        "Holesky:https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    )
    # --- End Configuration ---

    # Check for 'cast' command dependency
    if ! command -v cast &>/dev/null; then
        echo -e "${RED}Error: 'cast' command not found. Please install Foundry (https://getfoundry.sh).${NC}"
        return 1 # Use return instead of exit for functions
    fi

    local overall_status=0 # 0 = success, 1 = failure occurred

    # Loop through each wallet
    for wallet_address in "${wallets[@]}"; do
        echo -e "--- Checking Wallet: ${YELLOW}${wallet_address}${NC} ---"

        # Loop through each network for the current wallet
        for network_info in "${networks[@]}"; do
            # Split network info into name and URL
            IFS=':' read -r network_name rpc_url <<<"$network_info"

            local balance_output
            local exit_code

            # Construct and execute the command directly
            # Using 'cast balance --ether' (or 'cast b -e') to get balance in Ether
            # Capture stderr along with stdout to see potential errors from cast/RPC
            echo "Checking ${network_name}..."
            balance_output=$(cast balance --ether "${wallet_address}" --rpc-url "${rpc_url}" 2>&1)
            exit_code=$?

            if [ $exit_code -ne 0 ]; then
                # Report error but continue checking other networks/wallets
                echo -e "${RED}Error:${NC} Failed to get ${network_name} balance."
                echo -e "${RED}Details:${NC} ${balance_output}" # Show the error message from cast
                overall_status=1                                # Mark that at least one failure occurred
            else
                # Report success
                echo -e "${GREEN}${network_name} Balance:${NC} ${balance_output} ETH"
            fi
        done
        echo "-------------------------------------------------------"
    done

    # Final status report
    if [ $overall_status -ne 0 ]; then
        echo -e "${YELLOW}Balance Check Completed with errors.${NC}"
        return 1 # Indicate failure
    else
        echo -e "${GREEN}Balance Check Completed Successfully.${NC}"
        return 0 # Indicate success
    fi
}

# Sending function

cas() {
    echo -e "${GREEN}Sending function called${NC}"

    # --- Configuration ---
    local -a wallets=(
        "0x2ce40e5d9BC00dA5f397690E83E88183c4d4b23F"
        "0x5508D7e21f7B096481AfCc9bA2e2a405Be96b878"
        "0x2C1381655097598Bae22c5326b0F3B43220a18c4"
    )

    local -a keyz=(
        "0x3f03926cdb1f85a7b189060f53b0d055eb8c0cc9a838e929525eded8d7440dde"
        "0x6ce075e337c519ed35567152183557bbfec6d8c33d480464539a1fa2fd53dc04"
        "0xf66f5d4d5e2c7477f1139c94308732eb962309c2808838be8d7331f1a0b6806c"
    )

    # Network Configurations (Format: "NetworkName:RPC_URL")
    local -a networks=(
        "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
        "https://eth-holesky.g.alchemy.com/v2/y-cD2hUWMXwa6cAWy7uplLSSoRQ5v7Fx"
    )

    # --- AmountSend ---
    local amount_send=0.01 # Amount to send in ETH

    CO1="cast send --rpc-url ${networks[0]} --private-key ${keyz[0]} ${wallets[1]} --value ${amount_send}ether"

    echo -e "${GREEN}Sending ${amount_send} ETH from ${wallets[0]} to ${wallets[1]} on ${networks[0]}...${NC}"
    send_output=$(eval "$CO1" 2>&1)
    if [ $? -ne 0 ]; then
        echo -e "${RED}Error: ${send_output}${NC}"
        return 1 # Indicate failure
    fi
    echo -e "${GREEN}Transaction successful: ${send_output}${NC}"
    echo -e "${GREEN}Transaction hash: ${send_output}${NC}"
}

# Execution
ca_wa_ba2
