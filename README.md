# Sharing Profit via Smart Contracts
Implementing a multifaceted profitsharing process on blockchain smartcontracts.


## Outline
Code implements and automates equally weighted profit splits, unequally weighted profit splis, and equity vesting process for a cadre of employees including the leadership.

## Level One: Associate Profit Splitter Contract 
Contract will accept Ether into the contract and divide the Ether evenly among the associate level employees. This will allow the Human Resources department to pay employees quickly and efficiently. Implemented by "AssociateProfitSplitter.sol" contract. 

MetaMask account identification:
HR = Account #1
employee_one = Account #2
employee_two = Account #3
employee_three = Account #4

pre transaction balances: ![Accounts_initial_values_AssociateProfitSplitter](Screenshots/Accounts_initial_values_AssociateProfitSplitter.png)

## Level Two: Tiered Profit Splitter Contract
The Contract will distribute different percentages of incoming Ether to employees at different tiers/levels. The CEO gets paid 60%, CTO 25%, and Bob gets 15%. Implemented by "TieredProfitSplitter.sol" contract. 

## Level Three: Deferred Equity Plan Contract
The Contract that models traditional company stock plans. This contract will automatically manage 1000 shares with an annual distribution/vesting structure of 250 over 4 years for a single employee. Implemented by "DeferredEquityPlan.sol" contract. 

