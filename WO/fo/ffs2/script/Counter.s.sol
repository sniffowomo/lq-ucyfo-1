// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {BootySniff} from "../src/Counter.sol";

contract PantySmell is Script {
    PantySmell public pantySmell;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        pantySmell = new pantySmell();

        vm.stopBroadcast();
    }
}
