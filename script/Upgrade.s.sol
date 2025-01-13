// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {HelloWorldV2} from "../src/HelloWorldV2.sol";

contract UpgradeScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        address proxy = vm.envAddress("PROXY_ADDRESS");
        Upgrades.upgradeProxy(
            proxy,
            "HelloWorldV2.sol",
            abi.encodeCall(HelloWorldV2.initialize, ("Hello World v2!"))
        );

        console.log(HelloWorldV2(payable(proxy)).hello());

        vm.stopBroadcast();
    }
}
