//SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;

contract basicDapp{

    uint balance;

    constructor(){
        balance =0;

    }

    function sendBalance (uint amount) public {
        balance +=amount;

    }

    function withdrawBalance (uint amount) public {
        require(balance < amount , "not enough balance");
        balance -=amount;
        
    }
    
    function getbalance () public view returns (uint)
    {
        return balance;
    }

}

