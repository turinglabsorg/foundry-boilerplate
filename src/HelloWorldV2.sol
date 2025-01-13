// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/// @custom:oz-upgrades-from HelloWorld
contract HelloWorldV2 {
    string public message;
    bool public initialized;

    function initialize(string memory _message) public {
        require(!initialized, "Already initialized");
        message = _message;
        initialized = true;
    }

    function hello() public view returns (string memory) {
        return message;
    }
}
