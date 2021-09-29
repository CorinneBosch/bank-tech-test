require 'date'

class Transaction

  def credit(deposit_amount, balance)
    check_deposit(deposit_amount)
    "#{date_today} || #{'%.2f' % deposit_amount} || || #{'%.2f' % balance}"
  end

  def debit(withdrawal_amount, balance)
    "#{date_today} || || #{'%.2f' % withdrawal_amount} || #{'%.2f' % balance}"
  end

  private
  def check_deposit(deposit_amount)
    error1 = 'Please deposit a valid amount above 5 pounds'
    raise error1 if deposit_amount.is_a? String
    error2 = 'Only deposits in pounds with no pence acceppted'
    raise error2 if deposit_amount.round(0) != deposit_amount
    raise 'Deposit amount needs to be above 5 pounds' if deposit_amount < 5
  end

  def date_today
    Date.today.strftime("%d/%m/%Y")
  end
end

# acc = Transaction.new.credit('banana', 200)