require 'date'

class Transaction

  def credit(deposit_amount, balance)
    "#{date_today} || #{'%.2f' % deposit_amount} || || #{'%.2f' % balance}"
  end

  def debit(withdrawal_amount, balance)
    "#{date_today} || || #{'%.2f' % withdrawal_amount} || #{'%.2f' % balance}"
  end

  private

  def date_today
    Date.today.strftime("%d/%m/%Y")
  end
end