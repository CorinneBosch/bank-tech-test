require 'bank_account'

describe BankAccount do
  let(:account) { described_class.new('Sir David Attenborough') }

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
    it 'deposits money and adds to accounts balance' do
      account.credit(1000)
      expect(account.balance).to eq(1000)
    end
  end

  describe '#debit' do
    # it '' do
      
    # end
  end

  describe '#statement' do
    # it '' do
      
    # end
  end
end