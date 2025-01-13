// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address proxy = Upgrades.deployTransparentProxy(
            "HelloWorld.sol",
            vm.addr(deployerPrivateKey),
            ""
        );
        console.log("Proxy deployed at:", proxy);

        console.log(HelloWorld(payable(proxy)).hello());

        vm.stopBroadcast();
    }
}
