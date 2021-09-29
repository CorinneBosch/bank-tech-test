require 'bank'
require_relative 'helper_methods'

describe Bank do

  let(:bank) { described_class.new(Account.new('Professor McGonagall', 500)) }

  describe '#initialize' do
    it 'with name' do
      new_bank = Bank.new(Account.new('Gandalf', 500))
      expect(new_bank.account.name).to eq('Gandalf')
    end

    it 'with balance' do
      new_bank = Bank.new(Account.new('Hegrid', 500))
      expect(new_bank.account.balance).to eq(500)
    end

    it 'with empty transactions array by default' do
      new_bank = Bank.new(Account.new('Dobby'))
      expect(new_bank.account.transactions).to be_empty
    end
  end

  # describe '#credit' do
  #   let(:account) { double('Account') }

  #   it 'deposits money and adds amount to accounts balance' do
  #     # account = double('Account')
  #     expect(account).to receive(:name).with('Gandalf')
  #     expect(account).to receive(:balance).with(200)
  #     Bank.new.credit(200)
  #   end
  # end

  describe '#credit' do
    it 'deposits money and adds amount to accounts balance' do
      bank.credit(100)
      expect(bank.account.balance).to eq(600)
    end

    it 'appends transaction message to accounts transactions array' do
      bank.credit(100)
      transactions_array = ["#{test_date} || 100.00 || || 600.00"]
      expect(bank.account.transactions).to eq transactions_array
    end
  end

  context '#debit' do
    it 'withdrawals money and subtracts amount from accounts balance' do
      bank.debit(80)
      expect(bank.account.balance).to eq(420)
    end

    it 'appends transaction message to accounts transactions array' do
      bank.debit(80)
      transactions_array = ["#{test_date} || || 80.00 || 420.00"]
      expect(bank.account.transactions).to eq transactions_array
    end
  end

  # describe '#print_statement' do
  #   it 'displays table with 4 titles' do
  #     expect(account.print_statement).to eq('date || credit || debit || balance')
  #   end
  # end
end