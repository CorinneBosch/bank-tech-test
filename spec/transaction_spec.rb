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
  end

  describe '#debit' do
    it 'creates string with date, blank credit, debit amount and total balance' do
      withdrawal = 100
      allow(account).to receive(:balance).and_return(500 - withdrawal)
      transaction_message = "#{test_date} || || 100.00 || 400.00"
      expect(transaction.debit(withdrawal, account.balance)).to eq transaction_message
    end
  end
end