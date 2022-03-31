require_relative '../lib/bank_account'
require_relative '../lib/transaction'

describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'has default balance when created' do
    expect(bank_account.current_balance).to eq(BankAccount::START_BALANCE)
  end

  describe '#deposit' do
    it 'adds a specified amount and logs one transaction into the bank account' do
      bank_account.deposit(1000)
      expect(bank_account.current_balance).to eq(1000)
      expect(bank_account.transactions).to include(an_instance_of(Transaction))
      expect(bank_account.transactions.length).to be(1)
    end
  end

  describe '#withdraw' do
    it 'removes a specified amount and logs one transaction from the bank account' do
      bank_account.withdraw(500)
      expect(bank_account.current_balance).to eq(-500)
      expect(bank_account.transactions).to include(an_instance_of(Transaction))
      expect(bank_account.transactions.length).to be(1)
    end
  end

  describe '#create_statement' do
    it 'passes all transactions that have happened within the bank account to a new statement' do
      statement = double(statement)
      allow(statement).to receive(:add_transactions).with(bank_account.transactions)
      allow(statement).to receive(:print_statement)
      expect(bank_account).to receive(:create_statement)
      bank_account.create_statement(statement)
    end
  end
end
