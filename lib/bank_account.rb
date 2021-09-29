class BankAccount
  attr_reader :name, :balance, :transactions, :print_statement

  DEFAULT_BALANCE  = 0
  def initialize(account_holders_name, start_balance=DEFAULT_BALANCE)
   @name = account_holders_name
   @balance = start_balance
   @transactions =[]
  end

  def credit(deposit_amount)
    @balance += deposit_amount
  end

  def debit(withdrawal_amount)
    @balance -= withdrawal_amount
  end

  def print_statement
    'date || credit || debit || balance'
  end
end

# account = BankAccount.new('Sir David Attenborough')
# account.print_statement
