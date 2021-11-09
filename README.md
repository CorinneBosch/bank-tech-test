# Bank-Tech-Test

```
||====================================================================||
||//$\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//$\\||
||(100)==================| FEDERAL RESERVE NOTE |================(100)||
||\\$//        ~         '------========--------'                \\$//||
||<< /        /$\              // ____ \\                         \ >>||
||>>|  12    //L\\            // ///..) \\         L38036133B   12 |<<||
||<<|        \\ //           || <||  >\  ||                        |>>||
||>>|         \$/            ||  $$ --/  ||        One Hundred     |<<||
||<<|      L38036133B        *\\  |\_/  //* series                 |>>||
||>>|  12                     *\\/___\_//*   1989                  |<<||
||<<\      Treasurer     ______/Franklin\________     Secretary 12 />>||
||//$\                 ~|     MAKERS ACADEMY     |~               /$\\||
||(100)===================  ONE HUNDRED POUNDS  =================(100)||
||\\$//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\$//||
||====================================================================||
```

## Setup

1. **Fork** this [Bank-Tech-Test Repository](https://github.com/CorinneBosch/bank-tech-test)
2. Clone **your** fork to your computer or clone this repository directly.

```
$ git clone https://github.com/CorinneBosch/bank-tech-test.git
```

3. Ensure you have a `Ruby` version >= 3.0.1 and `rspec` installed.
4. Run `gem install bundler` if you dont have bundler.
5. Once installed, run `bundle` to ensure you have all the gems.

## Interact with the program

`irb`

Require the bank file:

`require './lib/bank.rb'`

You can give your account a name and a custom default balance.\
If no balance given - your default balance will be £0.\
Create a new bank account:

`bank_account = Bank.new(Account.new('Sir David Attenborough', 200))`

Now feel free and make as many deposits and withdraws as you please.\
The program will notify you if your transaction was successfull or if your input amount is invalid.

`bank_account.credit(200)`
`bank_account.debit(7.99)`
`bank_account.credit(60.00)`
`bank_account.debit(25)`

Meanwhile if you are interested in the account's balance without printing the statement just yet:

`bank_account.check_balance`

To print out the statement of all transactions made thus far:

`bank_account.print_statement`

You are still able to further interact with the program and make more transactions.\
To leave the program exit irb.

`exit`

## Rspec and Simplecov

To test all units and features at once in your terminal.\
Print out the format documentation with the `-fd` shortcut.

```
$ rspec
$ rspec -fd
```

To test inividual unit test in your terminal:

```
$ rspec spec/account_spec.rb -fd
$ rspec spec/bank_spec.rb -fd
$ rspec spec/feature_spec.rb -fd
$ rspec spec/statement_spec.rb -fd
$ rspec spec/transaction_spec.rb -fd
```

A `simplecov` Coverage report is automatically generated when running `rspec` in your command line.
To gain a better overview, direct into your `coverage` directory and open `index.html` in your terminal. Your browser will open and display the coverage of all files.

```
$ open coverage/index.html
```

## Planning & Userstories:

I started by creating the simplest `BankAccount` class and then extracted the logic into two other classes, `Account`, `Transaction` and one Module `Statement`.
My planning prior to the challenge: [Mindmap/Workflow](https://github.com/CorinneBosch/bank-tech-test/blob/main/images/mindmap.png)

```
As a User
So that I store my money securely
I would like to open a new account under my name...
...and have a start balance if desired

As a User
So that I store my money securely
I would like to make a deposit to my account

As a User
So that I invest my stored money
I would like to make a withdrawal from my account

As a User
So that I can have an overview over my exenses
I would like to print out my bank statements with dates
```

## Provided input output example & requirements

### Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2023\
And a deposit of 2000 on 13-01-2023\
And a withdrawal of 500 on 14-01-2023\
When she prints her bank statement\
Then she would see

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

Source of original Repository & instuctions: [Makers Academy GitHub](https://github.com/makersacademy/course/blob/main/individual_challenges/bank_tech_test.md)
