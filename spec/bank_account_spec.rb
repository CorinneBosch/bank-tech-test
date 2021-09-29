require 'bank_account'

describe BankAccount do
  describe '#initializes' do
    it 'with a name of the account holder' do 
      account = BankAccount.new('Sir David Attenborough')
      expect(account.name).to eq('Sir David Attenborough')
    end

    it 'with a default start balance of 0 when none given' do 
      account = BankAccount.new('Sir David Attenborough')
      expect(account.balance).to eq(0)
    end

    it 'with a custom start balance when given' do 
      account = BankAccount.new('Sir David Attenborough', 2000)
      expect(account.balance).to eq(2000)
    end
  end

end