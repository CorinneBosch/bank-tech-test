require_relative 'account'
require_relative 'statement'
require_relative 'transaction'

class Bank
  include Statement
  attr_reader :account

  def initialize(account = Account.new(account_holders_name, start_balance=DEFAULT_BALANCE))
    @account = account
  end

  def credit(deposit_amount)
    @account.balance += deposit_amount
    @account.transactions.push(Transaction.new.credit(deposit_amount, @account.balance))
    "£#{deposit_amount} successfully deposited"
  end

  def debit(withdrawal_amount)
    @account.balance -= withdrawal_amount
    @account.transactions.push(Transaction.new.debit(withdrawal_amount, @account.balance))
    "£#{withdrawal_amount} successfully withdrawn"
  end

  def print_statement
    check_transactions
    output(@account.transactions)
  end

  def check_balance
    "There is a total balance of £#{@account.balance} in #{@account.name}\'s account"
  end 

  private
  def check_transactions
    raise 'You have no transactions thus far' if @account.transactions.empty?
  end
end
