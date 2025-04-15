// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/utils/math/Math.sol";

//通过library的方式引入openzeppelin

contract MathUtils{

    using Math for uint256;
    function tryAdd() external{
        
        Math.min(1,2);

    }

    function tryAdd(uint256 a,uint256 b) external {
        a.min(b);
    }
    
}

//通过继承的方式引入openzeppelin
