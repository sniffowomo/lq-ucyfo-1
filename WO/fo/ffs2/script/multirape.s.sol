// Script ot deploy multiple contracts
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Fundme.sol";

contract RapeAll is Script {
    function run() public {
        vm.startBroadcast();

        Fundme fundMe = new Fundme();
        BootySmell booty = new BootySmell();
        
        vm.stopBroadcast();
    }
}