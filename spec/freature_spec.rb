require 'bank'
require_relative 'helper_methods'

describe Bank do
  let(:bank) { described_class.new(Account.new('Professor Snape')) }

  context 'test behaviour with many transactions' do
    it 'prints out statement correctly' do
      bank.credit(200)
      bank.debit(3.50)
      bank.debit(11.99)
      bank.credit(100)
      bank.debit(85.75)
      bank.credit(50)
      expect(bank.print_statement).to eq([
        "#{test_date} || 50.00 || || 248.76",
        "#{test_date} || || 85.75 || 198.76",
        "#{test_date} || 100.00 || || 284.51",
        "#{test_date} || || 11.99 || 184.51",
        "#{test_date} || || 3.50 || 196.50",
        "#{test_date} || 200.00 || || 200.00"
        ])
    end
  end
end
