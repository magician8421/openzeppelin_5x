// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "hardhat/console.sol";

/* Signature Verification

How to Sign and Verify
# Signing
1. Create message to sign
2. Hash the message
3. Sign the hash (off chain, keep your private key secret)

# Verify
1. Recreate hash from the original message
2. Recover signer from signature and hash
3. Compare recovered signer to claimed signer
*/

contract VerifySignature {




   function recover(string memory  message,bytes memory signature) external pure  {

        (bytes32 r,bytes32 s, uint8 v)=splitSignature(signature);
        bytes32 _signMessage=  keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", keccak256(bytes(message)))
        );
        address a= ecrecover(_signMessage, v, r, s);
        console.logAddress(a);


   }
   function splitSignature(bytes memory sig) public  pure  returns(bytes32 r,bytes32 s, uint8 v){ 

 
        assembly {
            /*
            First 32 bytes stores the length of the signature

            add(sig, 32) = pointer of sig + 32
            effectively, skips first 32 bytes of signature

            mload(p) loads next 32 bytes starting at the memory address p into memory
            */

            // first 32 bytes, after the length prefix
            r := mload(add(sig, 32))
            // second 32 bytes
            s := mload(add(sig, 64))
            // final byte (first byte of the next 32 bytes)
            v := byte(0, mload(add(sig, 96)))
        }

   }
}