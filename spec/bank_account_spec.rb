require 'bank_account'

describe BankAccount do
  describe '#initializes' do
    it 'with a name of the account holder' do 
      account = BankAccount.new('Sir David Attenborough')
      expect(account.name).to eq('Sir David Attenborough')
    end
  end

end