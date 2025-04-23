// Script ot deploy multiple contracts
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/FundMe.sol";

contract RapeAll is Script {
    address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    function run() public {
        vm.startBroadcast();

        new FundMe(priceFeedAddress);
        new BootySmell();

        vm.stopBroadcast();
    }
}
