require 'date'

class Transaction

  ERROR1 = 'Please deposit a valid amount above 5 pounds'
  ERROR2 = 'Only deposits in pounds with no pence are acceppted'
  ERROR3 = 'Deposit amount needs to be above 5 pounds'
  ERROR4 = 'Please input a positive Number as valid withdraw currecy'

  def credit(deposit_amount, balance)
    check_deposit(deposit_amount)
    "#{date_today} || #{'%.2f' % deposit_amount} || || #{'%.2f' % balance}"
  end

  def debit(withdrawal_amount, balance)
    check_withdrawal(withdrawal_amount, balance)
    "#{date_today} || || #{'%.2f' % withdrawal_amount} || #{'%.2f' % balance}"
  end

  private
  def check_deposit(deposit_amount)
    raise ERROR1 if !deposit_amount.is_a?(Numeric)
    raise ERROR2 if deposit_amount.round(0) != deposit_amount
    raise ERROR3 if deposit_amount < 5
  end

  def check_withdrawal(withdrawal_amount, balance)
    raise ERROR4 if !withdrawal_amount.is_a?(Numeric)
    raise ERROR4 if withdrawal_amount < 0
    error = "Your funds only allow you to withdraw £#{balance}"
    raise error if withdrawal_amount > balance
  end

  def date_today
    Date.today.strftime("%d/%m/%Y")
  end
end
