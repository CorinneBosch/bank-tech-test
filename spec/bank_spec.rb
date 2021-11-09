require 'bank'
require_relative 'helper_methods'

describe Bank do

  let(:transaction_class) { double :transaction_class }
  let(:transaction_instance) { double :transaction_instance }
  let(:account_class) { double :account_class }
  let(:account_instance) { double :account_class, balance: 600, transactions: ["#{test_date} || 100.00 || || 600.00"] }

  let(:bank) { described_class.new(Account.new('Professor McGonagall', 500), transaction_class)  }
  let(:bank_2) { described_class.new(Account.new('Professor McGonagall', 500))  }
  let(:bank_3) { described_class.new(account_class, transaction_class)  }

  before(:each) do
    allow(transaction_class).to receive(:new).and_return(transaction_instance)
    allow(account_class).to receive(:new).and_return(account_instance)
  end

  context '#initialize' do
    # it 'with name' do
    #   new_bank = Bank.new(Account.new('Gandalf', 500))
    #   expect(new_bank.account.name).to eq('Gandalf')
    # end

    # it 'with balance' do
    #   new_bank = Bank.new(Account.new('Hegrid', 500))
    #   expect(new_bank.account.balance).to eq(500)
    # end

    # it 'with empty transactions array by default' do
    #   new_bank = Bank.new(Account.new('Dobby'))
    #   expect(new_bank.account.transactions).to be_empty
    # end
  end

  context '#credit' do
    it 'informs account holder with success notification' do
      allow(transaction_instance).to receive(:credit).with(80, 580)
      expect(bank.credit(80)).to eq('£80 successfully deposited')
      # p transaction_instance
    end

    it 'appends transaction message to accounts transactions array that can be read' do
      # allow(transaction_instance).to receive(:credit).with(100, 600)
      bank_2.credit(100)
      statement = ["#{test_date} || 100.00 || || 600.00"]
      expect(bank_2.print_statement).to eq statement
    end

    # mock transactions array
    it 'appends transaction message to accounts transactions array that can be read' do
      allow(account_class).to receive(:balance).and_return(600)
      allow(account_class).to receive(:add_to_balance).with(100)
      allow(account_class).to receive(:add_transaction).with(transaction_instance)

      allow(transaction_instance).to receive(:credit).with(100, 600)

      bank_3.credit(100)
      statement = ["#{test_date} || 100.00 || || 600.00"]
      expect(bank_3.print_statement).to eq statement
    end
  end

  context '#debit' do
    it 'informs account holder with success notification' do
      allow(transaction_instance).to receive(:debit).with(110, 390)
      expect(bank.debit(110)).to eq('£110 successfully withdrawn')
    end

    it 'appends transaction message to accounts transactions array that can be read' do
      # allow(transaction_instance).to receive(:debit).with(80, 420)
      bank_2.debit(80)
      statement = ["#{test_date} || || 80.00 || 420.00"]
      expect(bank_2.print_statement).to eq statement
    end
  end

  context '#print_statement' do
    it 'returns accout transactions in reverse chronological order' do
      # allow(transaction_instance).to receive(:credit).with(200, 700)
      bank_2.credit(200)
      # allow(transaction_instance).to receive(:debit).with(80, 620)
      bank_2.debit(80)
      expect(bank_2.print_statement).to eq([
        "#{test_date} || || 80.00 || 620.00", 
        "#{test_date} || 200.00 || || 700.00"
        ])
    end
  
    context 'raises error' do 
      it 'when account transactions is empty' do
        message = 'You have no transactions thus far'
        expect { bank.print_statement }.to raise_error message
      end
    end
  end

  context '#check_balance' do
    it 'informs account holder about current balance' do
      message = "There is a total balance of £500 in Professor McGonagall\'s account"
      expect(bank.check_balance).to eq message 
    end
  end
end