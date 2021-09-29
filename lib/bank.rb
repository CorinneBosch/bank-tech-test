require_relative 'account'
require_relative 'transaction'

class Bank
  attr_reader :name, :balance, :transactions

  def initialize
    @account = 
  end

  def credit(deposit_amount)
    @balance += deposit_amount
    @transactions.push(Transaction.new.credit(deposit_amount, @balance))
  end

  def debit(withdrawal_amount)
    @balance -= withdrawal_amount
    @transactions.push(Transaction.new.debit(withdrawal_amount, @balance))
  end

end

# account = Bank.new('Sir David Attenborough', 50.0098)
# p account.balance
# account.credit(50)
# p account.balance
# p account.transactions