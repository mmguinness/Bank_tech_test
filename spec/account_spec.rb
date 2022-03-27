require_relative '../lib/account'

describe Account do
  subject(:account) { described_class.new }
  it 'has zero balance when created' do
    expect(account.balance).to eq(0)
  end

  describe '#credit' do
    it 'adds specified amount to the account balance' do
      account.credit(1000)
      expect(account.balance).to eq(1000)
    end
  end

end
