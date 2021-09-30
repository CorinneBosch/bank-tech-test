require 'transaction'
require_relative 'helper_methods'

describe Transaction do
  let(:transaction) { Transaction.new }
  let(:account) { instance_double('account') }

  describe '#credit' do
    it 'creates string with date, credit amount, blank debit and total balance' do
      deposit = 100
      allow(account).to receive(:balance).and_return(500 + deposit)
      transaction_message = "#{test_date} || 100.00 || || 600.00"
      expect(transaction.credit(deposit, account.balance)).to eq transaction_message
    end

    context 'raises error' do 
      it 'when credit amount is not an integer' do
        deposit = 'Bitcoin'
        allow(account).to receive(:balance).and_return('200' + deposit)
        expect { transaction.credit(deposit, account.balance) }.
          to raise_error(Transaction::ERROR1)
      end

      it 'when credit amount not a fixnum and has decimal values' do
        deposit = 100.09
        allow(account).to receive(:balance).and_return(200 + deposit)
        expect { transaction.credit(deposit, account.balance) }.
          to raise_error(Transaction::ERROR2)
      end

      it 'when credit amount is below 5 pounds' do
        deposit = 4
        allow(account).to receive(:balance).and_return(200 + deposit)
        expect { transaction.credit(deposit, account.balance) }.
          to raise_error(Transaction::ERROR3)
      end
    end

    context 'raises no error' do 
      it 'when amount has decimal values with zero' do
        deposit = 100.00
        allow(account).to receive(:balance).and_return(200 + deposit)
        expect { transaction.credit(deposit, account.balance) }.not_to raise_error
      end
    end
  end

  describe '#debit' do
    it 'creates string with date, blank credit, debit amount and total balance' do
      withdrawal = 100
      allow(account).to receive(:balance).and_return(500 - withdrawal)
      transaction_message = "#{test_date} || || 100.00 || 400.00"
      expect(transaction.debit(withdrawal, account.balance)).to eq transaction_message
    end
    
    it 'converts withdrawal to float with 2 decimal places' do
      withdrawal = 75.759
      allow(account).to receive(:balance).and_return(500 - withdrawal)
      transaction_message = "#{test_date} || || 75.76 || 424.24"
      expect(transaction.debit(withdrawal, account.balance)).to eq transaction_message
    end

    context 'raises error' do 
      it 'when withdrawal amount is not an integer' do
        withdrawal = 'Chocolate Gold'
        allow(account).to receive(:balance).and_return(withdrawal)
        expect { transaction.debit(withdrawal, account.balance) }.
          to raise_error(Transaction::ERROR4)
      end

      it 'when withdrawal amount is negative' do
        withdrawal = -2.52
        allow(account).to receive(:balance).and_return(200)
        expect { transaction.debit(withdrawal, account.balance) }.
          to raise_error(Transaction::ERROR4)
      end

      it 'when withdrawal is greater than accounts current balance' do
        withdrawal = 45
        allow(account).to receive(:balance).and_return(40)
        message = 'Your funds only allow you to withdraw £40'
        expect { transaction.debit(withdrawal, account.balance) }.
          to raise_error message
      end
    end
  end
end