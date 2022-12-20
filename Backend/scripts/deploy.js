const {ethers}=require("hardhat");
require("dotenv").config({path:".env"});

async function main(){
  const abctokenContract=await ethers.getContractFactory("ABCtokens");
  //deploying the contract
  const deployabctokenContract=await abctokenContract.deploy();
  console.log(abctokenContract);
  await deployabctokenContract.deployed();

  //printing the address of the contract
  console.log("Verifying Contract Address:",deployabctokenContract.address);
    
  

  console.log("Sleeping...");
  //waiting for etherscan to notice that the contract is deployed
  await sleep(30000);

  // Verify the contract after deploying
  await hre.run("verify:verify", {
    address: deployabctokenContract.address,
  });
}
function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

main()
  .then(()=>process.exit(0))
  .catch((error)=>{
    console.log(error);
    process.exit(1);
  });