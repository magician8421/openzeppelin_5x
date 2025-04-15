// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract C2NPermit is ERC20, ERC20Permit {
    constructor() ERC20("C2NPermit", "C2N") ERC20Permit("C2NPermit") {
        _mint(msg.sender, 100 * 10 ** decimals());
    }
}