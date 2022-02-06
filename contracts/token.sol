pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Hodefy is ERC20 {
    address payable owner;

    modifier onlyOwnerCanMint() {
        require(msg.sender == owner, "You're not the owner. Minting denied");
        _;
    }

    constructor(uint256 initialSupply) public ERC20("Hodefy", "HDF") {
        owner = payable(msg.sender);
        mint(owner, initialSupply);
    }

    function mint(address recipient, uint256 amount) public onlyOwnerCanMint {
        ERC20._mint(recipient, amount);
    }

    // 000000000000000000 (18 zeros)
    // 000,000,000
}
