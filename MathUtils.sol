// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/utils/math/Math.sol";
contract MathUtils{

   using Math for uint256;

 
    function testAdd(uint a,uint b ) external  pure{

        Math.tryAdd(a,b);
  
    }
   function testAdd2(uint a,uint b ) external  pure{
  
       a.tryAdd(b);
    }

 
}