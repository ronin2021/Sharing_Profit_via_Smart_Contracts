pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    // create a constructor funtion that accepts the addresses.
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }
    // Contract is sending ETH to the employees, as such it should not store ETH in it and must return "0" as a value.
    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    function deposit() public payable {
        // Split `msg.value` into three
        
        uint amount = msg.value / 3; 

        // Transfer the amount to each employee
        
        employee_one.transfer(amount);
        employee_two.transfer(amount); 
        employee_three.transfer(amount);

        // Take care of a potential remainder by sending back to HR (`msg.sender`)
        
        msg.sender.transfer(msg.value - (amount * 3));
    }

    function() external payable {
        // Enforce that the `deposit` function is called in the fallback function!
        
        // Ensures deposit executes in case ETH is sent directly to the contract. 
        // Necessary to prevent ETH being locked in contract in the absence of a withdraw method/function 
        
        
        deposit();
    }
}