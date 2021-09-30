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
||====================================================================||>||
||//$\\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\//$\\||<||
||(100)==================| FEDERAL RESERVE NOTE |================(100)||>||
||\\$//        ~         '------========--------'                \\$//||\||
||<< /        /$\              // ____ \\                         \ >>||)||
||>>|  12    //L\\            // ///..) \\         L38036133B   12 |<<||/||
||<<|        \\ //           || <||  >\  ||                        |>>||=||
||>>|         \$/            ||  $$ --/  ||        One Hundred     |<<||
||<<|      L38036133B        *\\  |\_/  //* series                 |>>||
||>>|  12                     *\\/___\_//*   1989                  |<<||
||<<\      Treasurer     ______/Franklin\________     Secretary 12 />>||
||//$\                 ~|     MAKERS ACADEMY     |~               /$\\||
||(100)===================  ONE HUNDRED DOLLARS =================(100)||
||\\$//\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\\$//||
||====================================================================||
```

## Implementation

## Setup

1. **Fork** this [Bank-Tech-Test Repository](https://github.com/CorinneBosch/bank-tech-test)
2. Clone **your** fork to your computer or clone this repository directly.

```
$ git clone https://github.com/CorinneBosch/bank-tech-test.git
```

3. Ensure you have `Ruby` and `rspec` installed.
4. Run `gem install bundler` if you dont have bundler.
5. Once installed, run `bundle` to ensure you have all the gems.

## How to interact

```

```

## Rspec and Simplecov

To test all units and features at once in your terminal.\
Print out the format documentation with the `-fd` shortcut.

```
$ rspec
$ rspec -fd
```

To test inividual unit test in your terminal

```
$ rspec spec/account_spec.rb
$ rspec spec/bank_spec.rb
$ rspec spec/feature_spec.rb
$ rspec spec/statement_spec.rb
$ rspec spec/transaction_spec.rb
```

A `simplecov` Coverage report is automatically generated when running `rspec` in your command line.
To gain a better overview, direct into your `coverage` directory and open `index.html` in your terminal. Your browser will open and display the coverage of all files.

```
$ cd coverage
$ open index.html
```

## Planning & Userstories:

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

## Povided input output example

```
date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
```

Source of original Repository & README instuctions: [Makers Academy GitHub](https://github.com/makersacademy/course/blob/main/individual_challenges/bank_tech_test.md)
