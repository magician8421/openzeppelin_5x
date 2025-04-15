const ethers = require("ethers");
const hre = require("hardhat");

async function getPermitSignature(wallet, token, spender, value, deadline) {
  const [nonce, name, version, chainId] = await Promise.all([
    0,
    "C2NPermit",
    "1",
    (await wallet.provider.getNetwork()).chainId,
  ]);
  const tokenAddress = await token.getAddress();
  return ethers.Signature.from(
    await wallet.signTypedData(
      {
        name: name,
        version: version,
        chainId: chainId,
        verifyingContract: tokenAddress, // 签名被哪个合约所验证
      },
      {
        Permit: [
          {
            name: "owner",
            type: "address",
          },
          {
            name: "spender",
            type: "address",
          },
          {
            name: "value",
            type: "uint256",
          },
          {
            name: "nonce",
            type: "uint256",
          },
          {
            name: "deadline",
            type: "uint256",
          },
        ],
      },
      {
        owner: wallet.address,
        spender: spender.address,
        value,
        nonce,
        deadline,
      }
    )
  );
}

// 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 signer1
// 0x70997970C51812dc3A010C7d01b50e0d17dc79C8 signer2
async function test() {
  try {
    // 部署合约
    const [signer1, signer2] = await hre.ethers.getSigners();
    console.log(signer1.address, "signer2 address:", signer2.address);
    const contract = await hre.ethers.getContractFactory("C2NPermit");
    const token = await contract.deploy();
    console.log("token address:", await token.getAddress());
    await token.waitForDeployment();

    const allowance = ethers.parseUnits("100", 18);
    const MaxUnit256 = ethers.MaxInt256;

    // // 签名
    const res = await getPermitSignature(
      signer1,
      token,
      signer2,
      allowance,
      MaxUnit256
    );
    const { r, s, v } = res;
    console.log("开始执行permit");
    await token.permit(signer1, signer2, allowance, MaxUnit256, v, r, s);
  } catch (error) {
    console.error("怎么会有错呢:", error);
  }
}

test();
