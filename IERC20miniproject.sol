// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; // This is the specific solidity compiler used to build our code

interface IERC20{ // Creating our interface

    function totalsupply() external view returns(uint); // This function states the amount of token in existence. This function is a getter and does not modify the state of the contract.
    function balanceof(address account) external view returns(uint); //This function states the balance of tokens in a wallet account. 
    function transfer(address recipent, uint amount) external returns(bool); // This function moves token from the function  caller's address to the recipient. It returns true if the transaction is successful
    function allowance(address owner, address spender) external view returns(uint); // This function allows another address retrieve tokens from the owner. 
    function approve(address spender, uint amount) external returns(bool); // This function approves the  allowance  of tokens for the recipent address to spend as set by the owner's address, The function returns true when the allowance is successfully set.
    function transferFrom(address sender, address recipient, uint amount) external returns(bool);// This function allows the recipient address call the approved tokens from the owner's. It  transfers from the sender's to the recipient address, when it is sucessful it returns true
    event Transfer(address indexed from, address indexed to, uint amount); // This event is emitted when the amount of tokens (value) is sent from the  address to another address.
    event approval(address indexed owner, address indexed spender, uint amount); // This event is emitted when the amount of tokens (value) is approved by the owner to be used by the spender
}
