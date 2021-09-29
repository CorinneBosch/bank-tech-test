require 'bank'

describe Bank do

  let(:bank) { described_class.new(Account.new('Gandalf', 500)) }

  let(:bank_double) { described_class.new(account) }
  let(:account) { instance_double('Account') }

  let(:bank_double2) { described_class.new(account_double) }
  let(:account_double) { double :account, name: 'Dobby', balance: 200, transaction: [] }



  context '#initialize' do
    it 'with name' do
      new_bank = Bank.new(Account.new('Gandalf', 500))
      expect(new_bank.account.name).to eq('Gandalf')
    end

    it 'with balance' do
      new_bank = Bank.new(Account.new('Hegrid', 500))
      expect(new_bank.account.balance).to eq(500)
    end

    it 'with empty transactions array by default' do
      new_bank = Bank.new(Account.new('Hegrid'))
      expect(new_bank.account.transactions).to be_empty
    end
  end

  context '#account double' do
    it 'has correct name' do
      expect(bank_double2.account).to have_attributes(:name => 'Dobby')
    end

    it 'has correct balance' do
      expect(bank_double2.account).to have_attributes(:balance => 200)
    end

    it 'has empty transactions array' do
      expect(bank_double2.account).to have_attributes(:transaction => [])
    end

    it 'confirms it correct name' do
      expect(bank_double2.account).not_to have_attributes(:name => 'Gandalf')
    end
  end

  context '#credit' do
    it 'deposits money and adds amount to accounts balance' do
      # allow(account).to receive(:balance).with(300)
      allow(bank_double.account).to receive(:balance) { 0 }
      # bank_double.credit(100)
      # expect(bank_double.account.balance).to eq(400)
      expect { bank_double.credit(100) }.to change { bank_double.account.balance }.by(100)
      p bank_double.account.balance
      # p bank_double.account.balance
    end
  end

  # context '#credit' do
  #   it 'deposits money and adds amount to accounts balance' do
  #     bank.credit(100)
  #     expect(bank.account.balance).to eq(600)
  #   end
  # end

  # context '#debit' do
  #   it 'withdrawals money and subtracts amount from accounts balance' do
  #     bank.debit(80)
  #     expect(bank.account.balance).to eq(120)
  #   end
  # end

  # describe '#print_statement' do
  #   it 'displays table with 4 titles' do
  #     expect(account.print_statement).to eq('date || credit || debit || balance')
  #   end
  # end
end