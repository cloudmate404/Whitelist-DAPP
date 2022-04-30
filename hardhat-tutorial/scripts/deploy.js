const { ethers } = require("hardhat");

async function main() {
  // Let the script know when contract we are deploying
  const WhitelistContract = await ethers.getContractFactory("Whitelist");

  // deploy the contract
  // 10 is the maximum number of whitelist addresses
  const deployedContract = await WhitelistContract.deploy(10);

  // wait for the deployment to finish
  await deployedContract.deployed();

  // print the address of the contract to the console
  console.log("Whitelist contract address: ", deployedContract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
