require_relative 'transaction'

class Bank
  attr_reader :name, :balance, :print_statement, :transactions
  # attr_writer :transactions

  DEFAULT_BALANCE  = 0
  def initialize(account_holders_name, start_balance=DEFAULT_BALANCE)
   @name = account_holders_name
   @balance = start_balance
   @transactions =[]
  end

  def credit(deposit_amount)
    @balance += deposit_amount
    @transactions.push(Transaction.new.credit(deposit_amount, @balance))
  end

  def debit(withdrawal_amount)
    @balance -= withdrawal_amount
  end

end

account = Bank.new('Sir David Attenborough')
account.credit(50)
p account.transactions