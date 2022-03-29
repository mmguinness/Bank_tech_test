require_relative '../lib/bank_account'
require_relative '../lib/transaction'

describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'contains no bank accounts when created' do
    expect(bank_account.accounts).to match_array([])
  end
  
  describe '#store_account' do    
    it 'can store a new bank account' do
      transaction = Transaction.new
      bank_account.store_account(transaction)
      expect(bank_account.accounts).to include(an_instance_of(Transaction))
    end

    it 'can store multiple bank accounts' do
      transaction_double = double(:transaction)
      bank_account.store_account(transaction_double)
      bank_account.store_account(transaction_double)
      bank_account.store_account(transaction_double)
      expect(bank_account.accounts.length).to eq(3)
    end
  end
  
  describe '#deposit' do
    it 'can add a specified amount to a given account' do
      transaction_double = double(:transaction)
      allow(transaction_double).to receive(:credit)
      bank_account.store_account(transaction_double)
      bank_account.deposit(transaction_double, 1000)
      expect(bank_account).to respond_to(:deposit).with(2).argument
    end
  end

  describe '#withdraw' do
    it 'can take a specified amount from a given account' do
      transaction_double = double(:transaction)
      allow(transaction_double).to receive(:credit)
      allow(transaction_double).to receive(:debit)
      bank_account.store_account(transaction_double)
      bank_account.deposit(transaction_double, 1000)
      bank_account.withdraw(transaction_double, 500)
      expect(bank_account).to respond_to(:withdraw).with(2).argument
    end
  end

  describe '#create_statement' do
    it 'can create a new statement for a given account' do
      # Account setup
      time_stub = Time.new(2020, 1, 0o1, 0o1)
      allow(Time).to receive(:now).and_return(time_stub)
      transaction = Transaction.new
      bank_account.store_account(transaction)
      bank_account.deposit(transaction, 1000)
      bank_account.withdraw(transaction, 100)
      # Print 
      output = 
"date || credit || debit || balance
01/01/2020 || || 100.00 || 900.00
01/01/2020 || 1000.00 || || 1000.00
"
      expect { bank_account.create_statement(transaction) }.to output(output).to_stdout
    end
  end

end
