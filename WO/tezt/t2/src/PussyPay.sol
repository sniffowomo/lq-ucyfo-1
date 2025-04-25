// SPDX-License-Identifier: PussyLiqaz

pragma solidity ^0.8.13;

contract PantyPay {
    function lick() public payable {
        require(msg.value > 0, "You need to send some ether");
    }
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}