// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


///////////////////////////////////////////////////////////
// IMPORTS
///////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////
// STRUCTS
///////////////////////////////////////////////////////////
struct TransferLog 
{
    address FromAddress;
    address ToAddress;
    uint Type; 
    uint Amount;
}