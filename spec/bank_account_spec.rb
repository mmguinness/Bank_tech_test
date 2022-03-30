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

#   describe '#print_statement' do
#     it 'prints a list of all transactions that have happened within the bank account' do
#       bank_account.deposit(1000)
#       bank_account.withdraw(100)
#       # Print 
#       output = 
# "date || credit || debit || balance
# 30/03/2020 || || 100.00 || 900.00
# 30/03/2020 || 1000.00 || || 1000.00
# "
#       expect { bank_account.print_statement }.to output(output).to_stdout
#     end
#   end

end

# time_stub = Time.new(2020, 1, 0o1, 0o1)
# allow(Time).to receive(:now).and_return(time_stub)
