// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract Dele{

    function call(address addr) external {
       (bool success,) = addr.delegatecall(abi.encodeWithSignature("initialize(uint256)", 1));
       require(success);
    }
}