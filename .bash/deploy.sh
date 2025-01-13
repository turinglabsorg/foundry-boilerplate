source .env
forge script --chain sepolia script/HelloWorld.s.sol:DeployScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv