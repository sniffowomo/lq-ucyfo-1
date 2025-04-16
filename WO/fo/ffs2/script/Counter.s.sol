// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {BootySniff} from "../src/Counter.sol";

contract BootySniffScript is Script {
    BootySniff public booty;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        booty = new BootySniff();

        vm.stopBroadcast();
    }
}
