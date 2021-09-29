require 'bank_account'

describe BankAccount do
  let(:account) { described_class.new('Sir David Attenborough', 500) }

  describe '#initializes' do
    it 'with a name of the account holder' do 
      new_account = BankAccount.new('Sir David Attenborough')
      expect(new_account.name).to eq('Sir David Attenborough')
    end

    it 'with a default start balance of 0 when none given' do 
      new_account = BankAccount.new('Sir David Attenborough')
      expect(new_account.balance).to eq(0)
    end

    it 'with a custom start balance when given' do 
      new_account = BankAccount.new('Sir David Attenborough', 2000)
      expect(new_account.balance).to eq(2000)
    end
  end

  describe '#credit' do
    it 'deposits money and adds amount to accounts balance' do
      account.credit(1000)
      expect(account.balance).to eq(1500)
    end
  end

  describe '#debit' do
    it 'withdrawals money and subtracts amount from accounts balance' do
      account.debit(80)
      expect(account.balance).to eq(420)
    end
  end

  describe '#print_statement' do
    it 'displays table with 4 titles' do
      expect(account.print_statement).to eq('date || credit || debit || balance')
    end
  end
end