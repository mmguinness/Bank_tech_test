require_relative '../lib/statement'

describe Statement do
  subject(:statement) { described_class.new }

  describe '#print_statement' do
    it 'returns the date, credit amount and total balance of a given account' do
      account = Account.new
      account.credit(1000)
      expect(statement.print_statement(account)).to eq("date || credit || balance\n28/03/2022 || 1000.00 || 1000.00")
    end
  end

end
