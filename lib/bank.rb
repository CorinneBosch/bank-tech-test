require_relative 'account'
require_relative 'transaction'

class Bank
  attr_reader :account

  def initialize(account = Account.new(account_holders_name, start_balance=DEFAULT_BALANCE))
    @account = account
  end

  def credit(deposit_amount)
    @account.balance += deposit_amount
    # @account.transactions.push(Transaction.new.credit(deposit_amount, @account.balance))
  end

  def debit(withdrawal_amount)
    @account.balance -= withdrawal_amount
    @account.transactions.push(Transaction.new.debit(withdrawal_amount, @account.balance))
  end

end

# bank = Bank.new(Account.new('Sir David Attenborough', 50.0098))
# p bank.account
# account.credit(50)
# p account.balance
# p account.transactions