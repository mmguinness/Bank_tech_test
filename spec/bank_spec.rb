require_relative '../lib/bank'
require_relative '../lib/account'

describe Bank do
  subject(:bank) { described_class.new }

  it 'contains no bank accounts when created' do
    expect(bank.accounts).to match_array([])
  end
  
  describe '#accounts' do    
    it 'can create a new bank account' do
      bank.create_account('first_account')
      expect(bank.accounts).to include(an_instance_of(Account))
    end

    let(:account) { double :account }
    it 'can store multiple bank accounts' do
      bank.create_account(account)
      bank.create_account(account)
      bank.create_account(account)
      expect(bank.accounts.length).to be(3)
    end
  end

end
