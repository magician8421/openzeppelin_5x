// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "hardhat/console.sol";
import "@openzeppelin/contracts/proxy/Proxy.sol";


contract A{

     address private _impl;

  constructor(address _addr){
        _impl=_addr;
     }
    


   function delegateCall() external {
      _impl.delegatecall(abi.encodeWithSelector(B.showDelegateCall.selector));
   }

     function call() external {
      _impl.call(abi.encodeWithSelector(B.showDelegateCall.selector));
   }



    
}
contract B{

    function showDelegateCall() external view  {

        console.log(address(this));
    }
}