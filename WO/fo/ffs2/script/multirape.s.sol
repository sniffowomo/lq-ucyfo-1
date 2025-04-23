// Script ot deploy multiple contracts
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Fundme.sol";

contract DeployAll is Script {
    function run() public {
        vm.startBroadcast();

        ContractA a = new ContractA();
        ContractB b = new ContractB();
        ContractC c = new ContractC();

        vm.stopBroadcast();
    }
}