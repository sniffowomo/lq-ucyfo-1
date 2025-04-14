// Source - https://github.com/Cyfrin/foundry-simple-storage-cu/blob/main/src/SimpleStorage.sol

// SPDX-License-Identifier: SmellPanty
pragma solidity ^0.8.19;

contract SimpleStorage {

    uint256 myFavNum;

    struct Person {
        uint256 favNum;
        string name;
    }

    Person[] public listofPeople;

    mapping(string => uint256) public nameToFavNum;

    function store(uint256 _myFavNum) public {
        myFavNum = _myFavNum;
    }






}