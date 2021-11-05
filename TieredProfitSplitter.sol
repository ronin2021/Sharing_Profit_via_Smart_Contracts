pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; // CEO
    address payable employee_two; // CTO
    address payable employee_three; // BOB

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one; // CEO
        employee_two = _two; // CTO
        employee_three = _three; // BOB
    }

    // Should always return 0! Testing `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // Calculate and transfer the distribution percentage for the CEO
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        amount = points * 60;
        
        // Step 2: Add the `amount` to `total` to keep a running total
        total += amount;
        
        // Step 3: Transfer the `amount` to the ceo
        employee_one.transfer(amount);
          

        // Calculate and transfer the distribution percentage for the CTO
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        amount = points * 25;
        
        // Step 2: Add the `amount` to `total` to keep a running total
        total += amount;
        
        // Step 3: Transfer the `amount` to the CTO
        employee_two.transfer(amount);
        
        // Calculate and transfer the distribution percentage for BOB
        // Step 1: Set amount to equal `points` * the number of percentage points for this employe
        amount = points * 15;
        
        // Step 2: Add the `amount` to `total` to keep a running total
        total += amount;
        
        // Step 3: Transfer the `amount` to Bob
        employee_three.transfer(amount);
        
        
        // Send the remaining wei back to the CEO
        employee_one.transfer(msg.value - total); // ceo gets the remaining wei back
    }

    function() external payable {
        deposit();
    }
}