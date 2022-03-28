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

  it 'returns the transactions of a given account, in reverse order,' do
    account = Account.new
    account.credit(1000, '10/01/2023')
    account.credit(2000, '13/01/2023')
    account.debit(500, '14/01/2023')

    output = 
"date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
"
    expect { statement.print_statement(account) }.to output(output).to_stdout
  end

end
