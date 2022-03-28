require_relative '../lib/statement'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print_statement' do
    it 'returns the date, credit amount and total balance of a given account' do
      account = Account.new
      account.credit(1000)

      output =
"date || credit || debit || balance
28/03/2022 || 1000.00 || || 1000.00
"
      expect { statement.print_statement(account) }.to output(output).to_stdout
    end

    it 'returns the date, debit amount and total balance of a given account' do
      account = Account.new
      account.credit(1000)
      account.debit(500)

      output = 
"date || credit || debit || balance
28/03/2022 || || 500.00 || 500.00
28/03/2022 || 1000.00 || || 1000.00
"
      expect { statement.print_statement(account) }.to output(output).to_stdout
    end
  end
end
