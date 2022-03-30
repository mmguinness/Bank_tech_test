require_relative '../lib/bank_account'
require_relative '../lib/transaction'

describe BankAccount do
  subject(:bank_account) { described_class.new }

  it 'contains no transactions when created' do
    expect(bank_account.transactions).to match_array([])
  end

  it 'has zero balance when created' do
    expect(bank_account.balance).to eq(0)
  end
  
  describe '#deposit' do
    it 'can add a specified amount to bank account' do
      bank_account.deposit(1000)
      expect(bank_account.balance).to eq(1000)
    end
      
    it 'logs a transaction for the bank account' do
      bank_account.deposit(1000)
      expect(bank_account.transactions).to include(an_instance_of(Transaction))
    end
  end

  describe '#withdraw' do
    it 'can remove a specified amount from bank account' do
      bank_account.deposit(1000)
      bank_account.withdraw(500)
      expect(bank_account.balance).to eq(500)
    end

    it 'logs a transaction for the bank account' do
      bank_account.withdraw(500)
      expect(bank_account.transactions).to include(an_instance_of(Transaction))
    end
  end

#   describe '#create_statement' do
#     it 'can create a new statement for a given account' do
#       # Account setup
#       time_stub = Time.new(2020, 1, 0o1, 0o1)
#       allow(Time).to receive(:now).and_return(time_stub)
#       transaction = Transaction.new
#       bank_account.store_account(transaction)
#       bank_account.deposit(transaction, 1000)
#       bank_account.withdraw(transaction, 100)
#       # Print 
#       output = 
# "date || credit || debit || balance
# 01/01/2020 || || 100.00 || 900.00
# 01/01/2020 || 1000.00 || || 1000.00
# "
#       expect { bank_account.create_statement(transaction) }.to output(output).to_stdout
#     end
#   end

end
