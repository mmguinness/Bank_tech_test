require_relative '../lib/statement'
require_relative '../lib/transaction'
require_relative '../lib/bank_account'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print_statement' do

    it 'outputs the date, credit and balance of deposit transaction into a bank account' do
      transactions = [Transaction.new(1000, 500, nil)]
      statement = Statement.new(transactions)
      output = 
"date || credit || debit || balance
30/03/2022 || 500.00 ||  || 1000.00
"
      expect { statement.print_statement }.to output(output).to_stdout
    end

    it 'outputs the date, debit and balance of withdrawal transaction into a bank account' do
      transactions = [Transaction.new(1000, nil, 500)]
      statement = Statement.new(transactions)
      output = 
"date || credit || debit || balance
30/03/2022 ||  || 500.00 || 1000.00
"
      expect { statement.print_statement }.to output(output).to_stdout
    end

    it 'returns all transactions of bank account, in reverse order,' do
      transactions = [
        Transaction.new(1000, 1000, nil), 
        Transaction.new(3000, 2000, nil), 
        Transaction.new(2500, nil, 500)
      ]
      statement = Statement.new(transactions)
      output = 
"date || credit || debit || balance
30/03/2022 ||  || 500.00 || 2500.00
30/03/2022 || 2000.00 ||  || 3000.00
30/03/2022 || 1000.00 ||  || 1000.00
"
      expect { statement.print_statement }.to output(output).to_stdout
    end
  end
end
