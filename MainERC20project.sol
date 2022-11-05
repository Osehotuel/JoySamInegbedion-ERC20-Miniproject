// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;// This is the specific solidity compiler used to build our code

import "./IERC20miniproject.sol"; // Imported the Interface IERC20 code with the file name intererc20.sol

contract ERC20 is IERC20{ // Creating our contract, the contract states that ERC20 is IERC20

    uint public override totalsupply; // override means to prioritize, to differentiate the state variable of this code and the function of the same name that is in the interface. The state variable shows the total supply of the tokens in a wallet address.
    mapping(address => uint) public override balanceof; //This states the address of the owner and to check the balance of the owner
    mapping(address => mapping(address => uint)) public override allowance; // This states the address of the owner and the address of the recipient.
    string public name= "Tech4Dev"; // The tken name
    string public symbol="T4T"; // The symbol of the token
    uint public decimals = 18; // Decimals o of the token

    function transfer(address recipient, uint amount) external override returns (bool){ // Function transfer allows the owner (msg.sender )transfer token to a recipient address
        balanceof[msg.sender] -= amount; //method 1is deducting the amoount of tokens from the owner
        //balanceof[recipient] += amount; // This takes from the owner to add to the recipient

        //balanceof[msg.sender] = balanceof[msg.sender] - amount; //method 2

        balanceof[recipient] = balanceof[recipient] + amount; //method 1. This takes the amount from the owner balance and adds in the recipient's balance
        //balanceof[recipient]+= amount; method 2


        emit Transfer(msg.sender, recipient,amount); // The emit is the keyword to implement an event. This line specifies that the function emits the Transfer event
        return true;// If the transfer is successful, it returns as true
    }

    function approve(address spender, uint amount) external override returns(bool){ // This function approves the  allowance of token for the recipient to spend from the owner
        allowance[msg.sender] [spender] = amount; // this function allows the recipient access the tokens from the owner's address (msg.sender)

        emit approval(msg.sender, spender, amount); // This line specifies that the function emits the Approval event
        return true; // If the approval is sucessful, it returns true
    }

    function transferFrom(address sender, address recipient, uint amount) external override returns(bool){ // This function allows the transfer of tokens from the sender to the recipient, in this case the recipient calls the function
        allowance[sender][msg.sender] -=amount; // this is an array, this allows us push the value of tokens of the recipient wallet address
        balanceof[sender] -=amount; // this is deducting from the owner's wallet address
        balanceof[recipient] +=amount; //this is adding to the recipient wallet address
        emit Transfer(sender, recipient, amount); // This function emits the TransferFrom event
        return true; // If the TransferFroom is successful, it returns true
    }

    function mint(uint amount) public{ // Function Mint is to create more tokens
        balanceof[msg.sender] += amount; //add the inputed amount to the caller's balance
        totalsupply += amount; //when we mint, there's an increase in the total supply, the total supply of tokens is the amount of the tokens minted 
        emit Transfer(address(0), msg.sender, amount); // address is 0  because it's coming from an unknown address to the caller's address
    }
    
     
     function burn(uint amount)public{ // This function reduces or destroy the amount of tokens minted. Burn is the opposite of mint and burn creates scarcity
         balanceof[msg.sender] -= amount; // this reduces the amount of tokens from the owner's wallet address
         totalsupply -= amount; // This reflects a reduction in the total supply of the tokens
         emit Transfer(address(0), msg.sender, amount); // address is 0  because it's going to an unexisting address
    }
        }
        


