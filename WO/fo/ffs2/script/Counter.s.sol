// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {BootySniff} from "../src/Counter.sol";

contract BootySniff is Script {
    BootySniff public bootysniff;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        bootysniff = new bootysniff();

        vm.stopBroadcast();
    }
}
