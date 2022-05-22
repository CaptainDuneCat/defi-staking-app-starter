// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// This is how you would make a token if you were going to
// leverage the OpenZeppelin contracts. 
contract GhorbeToken is ERC20 {

    constructor(uint256 initialSupply) ERC20("Ghorbe", "GORB") {
        _mint(msg.sender, initialSupply);
    }

}
