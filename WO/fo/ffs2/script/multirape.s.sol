// Script ot deploy multiple contracts
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/FundMe.sol";

contract RapeAll is Script {
    function run() public {
        vm.startBroadcast();

        FundMe fundMe = new FundMe();
        BootySmell booty = new BootySmell();
        
        vm.stopBroadcast();
    }
}