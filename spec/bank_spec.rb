require_relative '../lib/bank'
require_relative '../lib/account'

describe Bank do
  subject(:bank) { described_class.new }

  it 'contains no bank accounts when created' do
    expect(bank.accounts).to match_array([])
  end
  
  describe '#store_account' do    
    it 'can store a new bank account' do
      first_account = Account.new
      bank.store_account(first_account)
      expect(bank.accounts).to include(an_instance_of(Account))
    end

    let(:account) { double :account }
    it 'can store multiple bank accounts' do
      bank.store_account(account)
      bank.store_account(account)
      bank.store_account(account)
      expect(bank.accounts.length).to eq(3)
    end
  end

  describe '#credit_account' do
    it 'can add a specified amount to a given account' do
      first_account = Account.new
      bank.store_account(first_account)
      bank.credit_account(first_account, 1000)
      expect(first_account.balance).to eq(1000)
    end
  end

  describe '#debit_account' do
    it 'can take a specified amount from a given account' do
      first_account = Account.new
      bank.store_account(first_account)
      bank.credit_account(first_account, 1000)
      bank.debit_account(first_account, 500)
      expect(first_account.balance).to eq(500)
    end
  end

end
