// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract DeployScript is Script {
    HelloWorld public helloWorld;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        helloWorld = new HelloWorld();

        vm.stopBroadcast();
    }
}
