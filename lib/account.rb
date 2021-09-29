class Account
  attr_reader :name, :balance, :transactions
  attr_writer :balance, :transactions
  
  DEFAULT_BALANCE = 0

  def initialize(account_holders_name, start_balance=DEFAULT_BALANCE)
   @name = account_holders_name
   @balance = start_balance
   @transactions = []
  end
end