# Bank Tech Test
A Ruby implementation of a simple banking app allowing withdrawals, deposits and the printing of bank statements.

[![Build Status](https://travis-ci.com/camjw/Bank-Tech-Test.svg?branch=master)](https://travis-ci.com/camjw/Bank-Tech-Test)
[![Maintainability](https://api.codeclimate.com/v1/badges/4ce38758cc63ae42e104/maintainability)](https://codeclimate.com/github/camjw/Bank-Tech-Test/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4ce38758cc63ae42e104/test_coverage)](https://codeclimate.com/github/camjw/Bank-Tech-Test/test_coverage)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

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

I did not consider it included in the brief that the date of the transaction should be the current date, i.e. the user should be able to specify the date they want a transaction recorded.

## Bank Statement specification

I found printing the bank statement the most complex part of this task. I inferred from the brief that the bank statement should satisfy the following properties:
- There should be a header to the table which looks like `date || credit || debit || balance`
- The transactions should appear in reverse chronological order
- Either the credit or debit column should contain a single space if the transaction is a deposit or withdrawal respectively.
- The balance should be updated in each row and shown to two decimal places

The balance specification doesn't include:
 - The name of the account holder
 - The time of the transaction
 - Any restrictions on overdrafts
