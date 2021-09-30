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

  describe '#credit' do
    it 'deposits money and adds amount to accounts balance' do
      bank.credit(100)
      expect(bank.account.balance).to eq(600)
    end

    it 'informs account holder with success notification' do
      expect(bank.credit(80)).to eq('£80 successfully deposited')
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

    it 'informs account holder with success notification' do
      expect(bank.debit(110)).to eq('£110 successfully withdrawn')
    end

    it 'appends transaction message to accounts transactions array' do
      bank.debit(80)
      transactions_array = ["#{test_date} || || 80.00 || 420.00"]
      expect(bank.account.transactions).to eq transactions_array
    end
  end

  describe '#print_statement' do
    it 'returns accout transactions in reverse chronological order' do
      bank.credit(200)
      bank.debit(80)
      expect(bank.print_statement).to eq([
        "#{test_date} || || 80.00 || 620.00", 
        "#{test_date} || 200.00 || || 700.00"
        ])
    end
  
    context 'raises error' do 
      it 'when account transactions is empty' do
        message = 'You have no transactions thus far'
        expect { bank.print_statement}.to raise_error message
      end
    end
  end

  describe '#check_balance' do
    it 'informs account holder about current balance' do
      message = "There is a total balance of £500 in Professor McGonagall\'s account"
      expect(bank.check_balance).to eq message 
    end
  end
end