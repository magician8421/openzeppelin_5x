// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;
import "@openzeppelin/contracts/access/AccessControl.sol";


contract MyContract is AccessControl {

    bytes32 public  constant ROLE_MANAGER= keccak256("ROLE_MANAGER");
    bytes32 public  constant ROLE_NORMAL= keccak256("ROLE_NORMAL");

    constructor() {
       _grantRole(DEFAULT_ADMIN_ROLE, _msgSender());
    }
    

    function setRoleAdmin() external onlyRole(DEFAULT_ADMIN_ROLE){
        _setRoleAdmin(ROLE_NORMAL, ROLE_MANAGER);
    }
    function normalThing() external  onlyRole(ROLE_NORMAL){
        // anyone can call this normalThing()
    }

    function specialThing() external onlyRole(ROLE_MANAGER)   {
        // only the owner can call specialThing()!
    }
}