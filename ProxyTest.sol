// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";



contract BoxV1 is Initializable{

  uint public  x;
    
 function initialize(uint _val) public initializer{
        x=_val;
    }
 function cal() external    {
        x=x+1;
 }

 function showInvoke() external  pure returns(bytes memory){
    return abi.encodeWithSelector(this.initialize.selector, 1);
 }
    
 
}

contract BoxV2 {

    uint public  x;
    constructor(){
        x=2;
    }

    function cal() external {
         x=x*2;
    }

 

    
}

 