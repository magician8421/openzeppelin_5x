// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
contract TestTranasction{
    mapping(address=>uint256) private balance;
    event SendEth(address indexed ,uint256 );
    function send() external payable {
        if(msg.value>0){
            balance[msg.sender]+=msg.value;
        }
       emit SendEth(msg.sender,msg.value );
    }
    function displayBalance(address _addr) external view returns(uint256) {
        return balance[_addr];
    }

    function testMap(mapping(string=>uint) memory a) external  view {

    }
}