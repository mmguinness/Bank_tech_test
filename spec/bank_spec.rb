require_relative '../lib/bank'

describe Bank do
  it 'contains no bank accounts when created' do
    bank = Bank.new
    expect(bank.accounts).to match_array([])
  end
end
