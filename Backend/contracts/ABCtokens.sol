//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ABCtokens is ERC20{
//constructor
constructor() ERC20("ABCTokens","ABC"){}

uint private raiseto = 10 ^ 18;
uint private limit=10 ^ 5;


//mint is called when useer needs to mint some ABC tokens
function mint(uint256 _quantity) public returns(bool){
    require(_quantity>0,"You cannot mint 0 tokens!");
    if(_quantity>limit)
    {
        revert("There is a limit to minting tokens");
    }
    //The quantity should be less than 100000 tokens
    _mint(msg.sender,_quantity*raiseto);
    return true;
}

//function to check whether thee token already exixts
function tokenbalance(address minter) internal view returns(uint256) {
    require(minter!=address(0),'Invalid address!');
    uint256 balance=balanceOf(minter);
    return balance;
}
}
