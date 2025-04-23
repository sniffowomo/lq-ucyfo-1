// SPDX-License-Identifier: SmellPanty

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    // Setup used for deployment of the contract
    function setUp() external {
        FundMe fundMe = new FundMe();
    }

    function testMinDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18, "Minimum dollar amount is not 5");
    }
}
