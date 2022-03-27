require_relative '../lib/account'

describe Account do
  subject(:account) { described_class.new }
  it 'has zero balance when created' do
    expect(account.balance).to eq(0)
  end
end
