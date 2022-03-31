require_relative '../lib/bank_account'
require_relative '../lib/transaction'

describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'contains no transactions when created' do
    expect(bank_account.transactions).to match_array([])
  end

  it 'has zero balance when created' do
    expect(bank_account.current_balance).to eq(0)
  end
  
  describe '#deposit' do
    it 'can add a specified amount to bank account' do
      bank_account.deposit(1000)
      expect(bank_account.current_balance).to eq(1000)
    end
      
    it 'logs a transaction for the bank account' do
      bank_account.deposit(1000)
      expect(bank_account.transactions).to include(an_instance_of(Transaction))
      expect(bank_account.transactions.length).to be(1)
    end
  end

  describe '#withdraw' do
    it 'can remove a specified amount from bank account' do
      bank_account.withdraw(500)
      expect(bank_account.current_balance).to eq(-500)
    end

    it 'logs a transaction for the bank account' do
      bank_account.withdraw(500)
      expect(bank_account.transactions).to include(an_instance_of(Transaction))
      expect(bank_account.transactions.length).to be(1)
    end
  end

  describe '#create_statement' do
    it 'passes all transactions that have happened within the bank account to a new statement' do
      statement = double(statement)
      allow(statement).to receive(:add_transactions)
      allow(statement).to receive(:print_statement)
      expect(bank_account).to receive(:create_statement)
      bank_account.create_statement(statement)
    end
  end

end
