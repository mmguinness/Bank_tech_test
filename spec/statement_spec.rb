require_relative '../lib/statement'
require_relative '../lib/transaction'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print_statement' do
    it 'outputs the date, credit amount and total balance of a given account' do
      # Account setup
      transaction = Transaction.new
      transaction.credit(1000)
      # Produce statement
      # Add stub for date!
      output =
"date || credit || debit || balance
29/03/2022 || 1000.00 || || 1000.00
"
      expect { statement.print_statement(transaction) }.to output(output).to_stdout
    end

    it 'outputs the date, credit and debit amount and total balance of a given account' do
      # Account setup
      transaction = Transaction.new
      transaction.credit(1000)
      transaction.debit(500)
      # Produce statement
      # Add stub for date!
      output = 
"date || credit || debit || balance
29/03/2022 || || 500.00 || 500.00
29/03/2022 || 1000.00 || || 1000.00
"
      expect { statement.print_statement(transaction) }.to output(output).to_stdout
    end
  end

  it 'returns the transactions of a given account, in reverse order,' do
    # Account setup
    transaction = Transaction.new
    transaction.credit(1000, '10/01/2023')
    transaction.credit(2000, '13/01/2023')
    transaction.debit(500, '14/01/2023')
    # Produce statement
    output = 
"date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
"
    expect { statement.print_statement(transaction) }.to output(output).to_stdout
  end

end
