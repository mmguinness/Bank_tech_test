require_relative '../lib/statement'
require_relative '../lib/transaction'
require_relative '../lib/bank_account'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print_statement' do

    it 'outputs the date, credit and balance of deposit transaction into a bank account' do
      transaction = Transaction.new
      transaction.save_info(1000, 500, nil)
      transactions = [transaction]
      statement = Statement.new
      statement.add_transactions(transactions)
      output = 
"date || credit || debit || balance
30/03/2022 || 500.00 ||  || 1000.00
"
      expect { statement.print_statement }.to output(output).to_stdout
    end

    it 'outputs the date, debit and balance of withdrawal transaction into a bank account' do
      transaction = Transaction.new
      transaction.save_info(1000, nil, 500)
      transactions = [transaction]
      statement = Statement.new
      statement.add_transactions(transactions)
      output = 
"date || credit || debit || balance
30/03/2022 ||  || 500.00 || 1000.00
"
      expect { statement.print_statement }.to output(output).to_stdout
    end

    it 'returns all transactions of bank account, in reverse order,' do
      transaction_01 = Transaction.new
      transaction_01.save_info(1000, 1000, nil)
      transaction_02 = Transaction.new
      transaction_02.save_info(3000, 2000, nil)
      transaction_03 = Transaction.new
      transaction_03.save_info(2500, nil, 500)
      
      transactions = [transaction_01, transaction_02, transaction_03]
      statement = Statement.new
      statement.add_transactions(transactions)
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
