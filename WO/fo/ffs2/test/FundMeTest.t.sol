// SPDX-License-Identifier: SmellPanty

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    address priceFeedAddress = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    // Setup used for deployment of the contract
    function setUp() external {
        FundMe fundMe = new FundMe(priceFeedAddress);
    }

    function testMinDollarIsFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18, "Minimum dollar amount is not 5");
    }
}
