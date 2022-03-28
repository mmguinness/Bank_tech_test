require_relative '../lib/statement'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print_statement' do
    it 'outputs the date, credit amount and total balance of a given account' do
      # Account setup
      account = Account.new
      account.credit(1000)
      # Produce statement
      output =
"date || credit || debit || balance
28/03/2022 || 1000.00 || || 1000.00
"
      expect { statement.print_statement(account) }.to output(output).to_stdout
    end

    it 'outputs the date, credit and debit amount and total balance of a given account' do
      # Account setup
      account = Account.new
      account.credit(1000)
      account.debit(500)
      # Produce statement
      output = 
"date || credit || debit || balance
28/03/2022 || || 500.00 || 500.00
28/03/2022 || 1000.00 || || 1000.00
"
      expect { statement.print_statement(account) }.to output(output).to_stdout
    end
  end

  it 'returns the transactions of a given account, in reverse order,' do
    # Account setup
    account = Account.new
    account.credit(1000, '10/01/2023')
    account.credit(2000, '13/01/2023')
    account.debit(500, '14/01/2023')
    # Produce statement
    output = 
"date || credit || debit || balance
14/01/2023 || || 500.00 || 2500.00
13/01/2023 || 2000.00 || || 3000.00
10/01/2023 || 1000.00 || || 1000.00
"
    expect { statement.print_statement(account) }.to output(output).to_stdout
  end

end

# My attempt to stub out the Accounts class for Statment test:

#     it 'outputs the date, credit amount and total balance of a given account' do
#       # Account setup with double
#       account_double = double(:account)
#       allow(account_double).to receive(:credit)
#       account_double.credit(1000)
#       allow(account_double).to receive(:format_statement)

#       # allow(account_double).to receive(:history).with(:each).and_return({ :date => "01/01/2020", :credit => 1000, :debit => 0, :balance => 1000 })
#       
#       allow(account_double).to receive(:history)
#       allow(account_double).to receive(:each).and_return(:date => "01/01/2020")
#       allow(account_double).to receive(:each).and_return(:credit => 1000)
#       allow(account_double).to receive(:each).and_return(:debit => 0)
#       allow(account_double).to receive(:each).and_return(:balance => 1000)

#       #Still getting  NoMethodError: undefined method `each' for nil:NilClass

#       # Produce statement
#       output =
# "date || credit || debit || balance
# 01/01/2020 || 1000.00 || || 1000.00
# "
#       expect { statement.print_statement(account_double) }.to output(output).to_stdout
#     end
