# Bank Tech Test

## User Stories

```
As a bank user
So that I can keep my money safe
I want to be able to deposit money to the bank

As a bank user
So that I can use my money
I want to be able to withdraw money from the bank

As a bank user
So that I can keep track of my money
I want to be able to see a bank statement with my deposits and withdrawals

As a bank
So that I can keep track of my customers' money
I want to be able to store transactions in memory
```

## Bank Statement specification

The bank statement should satisfy the following properties:
- The transactions should appear in reverse chronological order
- There should be a header to the table which looks like `date || credit || debit || balance`
- Either the credit or debit column should contain a single space if the transaction is a deposit or withdrawal respectively.
- The balance should be updated in each row and shown to 2dp

The balance specification doesn't include:
 - The name of the account holder
 - The time of the transaction
 - Any restrictions on overdrafts
