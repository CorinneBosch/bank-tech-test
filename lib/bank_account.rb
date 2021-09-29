class BankAccount
  attr_reader :name, :balance

  DEFAULT_BALANCE  = 0
  def initialize(account_holders_name, start_balance=DEFAULT_BALANCE)
   @name = account_holders_name
   @balance = start_balance
  end

  def credit(deposit_amount)
    @balance += deposit_amount
  end

  def debit(withdrawal_amount)
    @balance -= withdrawal_amount
  end
end