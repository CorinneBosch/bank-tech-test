module Statement
  COLUMN_TITLE = 'date || credit || debit || balance'
    
  def output(transactions)
    puts COLUMN_TITLE
    transactions.reverse.each do |msg|
      puts msg
    end
  end
end
