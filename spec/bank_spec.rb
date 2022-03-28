require_relative '../lib/bank'
require_relative '../lib/account'

describe Bank do
  subject(:bank) { described_class.new }

  it 'contains no bank accounts when created' do
    expect(bank.accounts).to match_array([])
  end
  
  describe '#store_account' do    
    it 'can store a new bank account' do
      account = Account.new
      bank.store_account(account)
      expect(bank.accounts).to include(an_instance_of(Account))
    end

    it 'can store multiple bank accounts' do
      account_double = double(:account)
      bank.store_account(account_double)
      bank.store_account(account_double)
      bank.store_account(account_double)
      expect(bank.accounts.length).to eq(3)
    end
  end
  
  describe '#deposit' do
    it 'can add a specified amount to a given account' do
      account_double = double(:account)
      allow(account_double).to receive(:credit)
      bank.store_account(account_double)
      bank.deposit(account_double, 1000)
      expect(bank).to respond_to(:deposit).with(2).argument
    end
  end

  describe '#withdraw' do
    it 'can take a specified amount from a given account' do
      account_double = double(:account)
      allow(account_double).to receive(:credit)
      allow(account_double).to receive(:debit)
      bank.store_account(account_double)
      bank.deposit(account_double, 1000)
      bank.withdraw(account_double, 500)
      expect(bank).to respond_to(:withdraw).with(2).argument
    end
  end

  describe '#create_statement' do
    it 'can create a new statement for a given account' do
      # Account setup
      time_stub = Time.new(2020, 1, 0o1, 0o1)
      allow(Time).to receive(:now).and_return(time_stub)
      account = Account.new
      bank.store_account(account)
      bank.deposit(account, 1000)
      bank.withdraw(account, 100)
      # Print 
      output = 
"date || credit || debit || balance
01/01/2020 || || 100.00 || 900.00
01/01/2020 || 1000.00 || || 1000.00
"
      expect { bank.create_statement(account) }.to output(output).to_stdout
    end
  end

end
