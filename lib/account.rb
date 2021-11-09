class Account
  attr_reader :name, :balance, :transactions 
  
  DEFAULT_BALANCE = 0
  
  def initialize(account_holders_name, start_balance=DEFAULT_BALANCE)
    @name = account_holders_name
    @balance = start_balance
    @transactions = []
  end

  def add_to_balance(transaction)
    @balance += transaction
  end

  def deduct_from_balance(transaction)
    @balance -= transaction 
  end

  def add_transaction(transaction)
    @transactions.push(transaction)
  end
end