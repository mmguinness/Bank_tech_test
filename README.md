# Bank_tech_test

## Description
A simple program to emulate a bank account. This is a practice project for demonstrating basic TDD and OOP principles. The project is in Ruby and can be run locally in irb.

* Acceptance criteria demonstrated in IRB: 

![Diagram](images/IRB_example_04.png)


## To run
* To install code and run locally:
 `git clone https://github.com/mmguinness/Bank_tech_test.git`
* Run `bundle install`
* Run `rpsec` to test
* Run `irb` to interact with code.
* To feature test in IRB and replicate results:
```
require './lib/bank_account'
require './lib/transaction'
require './lib/statement'
account = BankAccount.new
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
account.create_statement

date || credit || debit || balance
31/03/2022 ||  || 500.00 || 2500.00
31/03/2022 || 2000.00 ||  || 3000.00
31/03/2022 || 1000.00 ||  || 1000.00
```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB or Node.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2023  
**And** a deposit of 2000 on 13-01-2023  
**And** a withdrawal of 500 on 14-01-2023  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

## Process

* Use a TDD approach to completing the project:
   - Plan, Test, Implement, Refactor, Commit

* Domain model: 

![Diagram](images/Domain_model_06.png)
