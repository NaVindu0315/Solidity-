//SPDX-License-Identifier: MIT

pragma solidity ^0.8.22;


contract Calculator{
    uint256 result = 0;

    function add(uint num) public {
        result +=num;
    }

    function substract(uint num) public {
        result -= num;
    }

    
}