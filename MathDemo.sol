// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/utils/math/Math.sol";

contract MathUtils{

using Math for uint256;

function toCell(uint a,uint b) external  pure returns (uint256){
    return Math.ceilDiv(a,b);
}

function toCell2(uint a,uint b) external  pure returns (uint256){
    return a.ceilDiv(b);
}





}