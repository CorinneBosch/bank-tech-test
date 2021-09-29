require 'transaction'
require_relative 'helper_methods'

describe Transaction do
  let(:transaction) { described_class.new }
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
        deposit = 'Pineapple'
        allow(account).to receive(:balance).and_return('200' + deposit)
        message = 'Please deposit a valid amount above 5 pounds'
        expect { transaction.credit(deposit, account.balance) }.to raise_error message
      end

      it 'when credit amount is decimal values' do
        deposit = 100.09
        allow(account).to receive(:balance).and_return(200 + deposit)
        message = 'Only deposits in pounds with no pence acceppted'
        expect { transaction.credit(deposit, account.balance) }.to raise_error message
      end

      it 'when credit amount is below 5 pounds' do
        deposit = 4
        allow(account).to receive(:balance).and_return(200 + deposit)
        message = 'Deposit amount needs to be above 5 pounds'
        expect { transaction.credit(deposit, account.balance) }.to raise_error message
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
  end
end