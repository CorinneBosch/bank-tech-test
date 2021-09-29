require 'transaction'
require_relative 'helper_methods'

describe Transaction do
  let(:transaction) { described_class.new }

  describe '#credit' do
    it 'creates string with date, credit amount, blank debit and total balance' do
      deposit = 100
      balance = 500
      expect(transaction.credit(deposit, balance)).to eq "#{test_date} || 100.00 || || 500.00"
    end
  end

  describe '#debit' do
    it 'creates string with date, blank credit, debit amount and total balance' do
      withdrawal = 100
      balance = 500
      expect(transaction.debit(withdrawal, balance)).to eq "#{test_date} || || 100.00 || 500.00"
    end
  end
end