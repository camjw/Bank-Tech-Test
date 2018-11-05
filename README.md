# Bank Tech Test
A Ruby implementation of a simple banking app allowing withdrawals, deposits and the printing of bank statements.

[![Build Status](https://travis-ci.com/camjw/Bank-Tech-Test.svg?branch=master)](https://travis-ci.com/camjw/Bank-Tech-Test)
[![Maintainability](https://api.codeclimate.com/v1/badges/4ce38758cc63ae42e104/maintainability)](https://codeclimate.com/github/camjw/Bank-Tech-Test/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/4ce38758cc63ae42e104/test_coverage)](https://codeclimate.com/github/camjw/Bank-Tech-Test/test_coverage)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Motivation
This repo was created as a mock tech test. The brief for this tech test can be found [here](https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md).

## Technologies

The app is written in Ruby 2.5.0 and uses Rubocop 0.60.0 for linting. Travis CI and Codeclimate are used for CI and code quality checks respectively.

## Usage

### Installation
To use this app first clone the app:
```sh
git clone https://github.com/camjw/Bank-Tech-Test.git
```
And then from the root of the repo run `rspec`. There are 10 tests, all of which should be passing. These tests give 100% coverage of the app's source code.

### Using a bank account

To open a bank account run the following:
```ruby
$ irb
$ require './lib/interface'
$ account = Interface.new
```
Now, `account` is a new bank account instance which has methods `transaction` and `display_statement`. We can deposit and withdraw from our bank account:

```ruby
$ account.transaction('10/01/2012', 1000.00, 'deposit')
$ account.transaction('13/01/2012', 2000.00, 'deposit')
$ account.transaction('14/01/2012', 500.00, 'withdraw')
```
Finally, we can see the accounts statement:

```ruby
$ account.display_statement
$ #=> date || credit || debit || balance
$ #=> 14/01/2012 || || 500.00 || 2500.00
$ #=> 13/01/2012 || 2000.00 || || 3000.00
$ #=> 10/01/2012 || 1000.00 || || 1000.00
```

The `transaction` method takes three parameters, date, amount and transaction type. These must be in the following formats:
- date: string in the format `dd/mm/yyyy`
- amount: integer or float with no more than two decimal places
- type: either `'deposit'` or `'withdraw'`

The `display_statement` method takes no parameters.
## User Stories

From the brief, I decided the following user stories captured the intended product:

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
So that I can keep track of my customer's money
I want to be able to store transactions in memory
```

I did not consider it included in the brief that the date of the transaction should be the current date, i.e. the user should be able to specify the date they want a transaction recorded.

## Bank Statement specification

I found printing the bank statement the most complex part of this task. I inferred from the brief that the bank statement should satisfy the following properties:
- There should be a header to the table which looks like `date || credit || debit || balance`
- The transactions should appear in reverse chronological order
- Either the credit or debit column should contain a single space if the transaction is a deposit or withdrawal respectively.
- The balance should be updated in each row and shown to two decimal places

I decided that the balance specification did not include the following properties:
 - The name of the account holder
 - The time of the transaction
 - Any restrictions on overdrafts

## Examples

Since a lot of the methods I wrote initially belonged to classes but didn't actually rely on any instance variables I've refactored the app to include a series of helper modules.

These can be found in the lib/helpers folder.

## Printing the bank statement
Printing the bank statement was the most complex part to code as well as to specify. The `Interface#display_statement` queries the `TransactionHistory` class for a list of transactions and then directs the `Printer` to prettify and then print the transactions.

`Printer#prettify_transaction` is one of the longest methods in this repo:

```ruby
def prettify_transaction(trans)
  middle_cols = ['', format('%.2f', trans[1]) + ' ']
  middle_cols.reverse! if trans[2] == 'deposit'
  output_row = [trans[0] + ' '] + middle_cols + [format('%.2f', trans[3])]
  output_row.join('|| ')
end
```

It takes an array which looks like `[date, amount, type, final_balance]` and converts it to a string which looks either like
```
date || || amount_to_two_decimal_places || balance
```
or
```
date || amount_to_two_decimal_places || || balance
```
depending on whether the transaction is a withdraw or a deposit respectively.
### Error handling

A large part of this project, for me, was error handling and input sanitation. The user has to enter dates in the format `dd/mm/yyyy` to the transaction method. This is handled in the `InterfaceErrorHelper` module by the following methods:

```ruby
def check_for_valid_date(date)
  raise INVALID_DATE_ERROR unless valid_transaction_date?(date)
end

def valid_transaction_date?(date)
  day, month, year = date.split('/')
  Date.valid_date?(year.to_i, month.to_i, day.to_i)
rescue StandardError
  false
end
```

Similarly, there are error handling methods for the amount of money and transaction type passed to the `Interface#transaction` method.

There is also a error handling helper module for the `Printer` class which makes sure that the array of transactions passed to the printer is in reverse chronological order.
## Contributing
I would prefer not to receive contributions for this repo, thank you.

## License
This repo is licensed under the [MIT License](https://opensource.org/licenses/MIT).
