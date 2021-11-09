require 'account'

describe Account do
  let(:account) { described_class.new('Sir David Attenborough', 1000) }

  context '#initializes' do
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

  context '#add_to_balance' do 
    it 'adds transaction to balance' do 
      account.add_to_balance(100)
      expect(account.balance).to eq(1100)
    end
  end

  context '#deduct_from_balance' do 
    it 'deducts transaction from balance' do 
      account.deduct_from_balance(75)
      expect(account.balance).to eq(925) 
    end
  end

  context '#add_transaction' do 
    it 'adds transaction to balance' do 
      account.add_transaction(200)
      expect(account.transactions).to eq([200]) 
    end
  end
end