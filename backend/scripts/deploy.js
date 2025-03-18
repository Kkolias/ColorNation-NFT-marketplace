const { ethers } = require("hardhat");
const fs = require("fs");

async function main() {
  const countries = ["finland", "sweden"];
  const ColorNation = await ethers.getContractFactory("ColorNation");
  const colorNation = await ColorNation.deploy("Testi", "TST", countries);

  await colorNation.waitForDeployment();

  console.log("Deployed to: ", colorNation.target);

  const contractAddress = colorNation.target;
  const contractABI = JSON.parse(
    fs.readFileSync(
      "./artifacts/contracts/ColorNation.sol/ColorNation.json",
      "utf8"
    )
  ).abi;

  fs.writeFileSync(
    "../frontend/config.json",
    JSON.stringify({ contractAddress, contractABI }, null, 2)
  );
}

main().catch((e) => {
  console.error(e);
  process.exitCode = 1;
});
