//SPDX-License-Identifier: MIT
//tp dp :
pragma solidity ^0.8.22;

contract EventExample
{
    event NewUserRegistered();

    struct User
    {
        string username;
        uint256 age;
    }
}