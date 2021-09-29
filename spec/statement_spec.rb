require 'statement'
require_relative 'helper_methods'

describe Statement do
  let(:account) { Class.new { extend Statement } }

  it 'prints out statement in reverse chronological order' do 
    subject = account.output(TRANNSACTIONS)
    expect(subject).to eq([
      '10/01/2023 || 1000.00 || || 1000.00', 
      '13/01/2023 || 2000.00 || || 3000.00',
      '14/01/2023 || || 500.00 || 2500.00'
      ])
  end

end