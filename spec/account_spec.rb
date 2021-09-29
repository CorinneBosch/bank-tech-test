require 'account'

describe Account do
  let(:account) { described_class.new('Sir David Attenborough', 1000) }

  describe '#initializes' do
    it 'with a name of the account holder' do 
      new_account = Account.new('Sir David Attenborough')
      expect(new_account.name).to eq('Sir David Attenborough')
    end

    it 'with a default start balance of 0 when none given' do 
      new_account = Account.new('Sir David Attenborough')
      expect(new_account.balance).to eq(0)
    end

    it 'with a custom start balance when given' do 
      new_account = Account.new('Sir David Attenborough', 2000)
      expect(new_account.balance).to eq(2000)
    end

    it 'with an empty array of transactios' do 
      expect(account.transactions).to be_empty
    end
  end
end