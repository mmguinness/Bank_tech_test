require_relative '../lib/statement'
require_relative '../lib/transaction'

describe Statement do
  subject(:statement) { described_class.new }

  let(:transaction) { double(date: '01/01/2020', credit: '1000.00', debit: nil, balance: '1000.00') }
  let(:transaction02) { double(date: '01/01/2020', credit: '2000.00', debit: nil, balance: '3000.00') }
  let(:transaction03) { double(date: '01/01/2020', credit: nil, debit: '500.00', balance: '2500.00') }

  describe '#add_transaction' do
    it 'accepts an array of transactions into bank account' do
      expect(statement).to receive(:add_transactions).with([transaction])
      statement.add_transactions([transaction])
    end
  end

  describe '#print_statement' do
    it 'returns printed list of transactions, in reverse order,' do
      transactions = [transaction, transaction02, transaction03]
      statement.add_transactions(transactions)
      output = 'date || credit || debit || balance
01/01/2020 ||  || 500.00 || 2500.00
01/01/2020 || 2000.00 ||  || 3000.00
01/01/2020 || 1000.00 ||  || 1000.00
'
      expect { statement.print_statement }.to output(output).to_stdout
    end
  end
end
