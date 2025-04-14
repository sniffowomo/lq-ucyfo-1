// Source - https://github.com/Cyfrin/foundry-simple-storage-cu/blob/main/src/SimpleStorage.sol

// SPDX-License-Identifier: SmellPanty
pragma solidity ^0.8.19;

contract SimpleStorage {

    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listofPeop
}