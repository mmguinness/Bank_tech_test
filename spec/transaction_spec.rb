require_relative '../lib/transaction'

describe Transaction do
  subject(:transaction) { described_class.new }

  describe '#save_info' do
    it 'stores the date, value amount and balance of transaction' do
      transaction.add_transaction_data(1000, 500, nil)
      expect(transaction.date).to eq("31/03/2022")
      expect(transaction.balance).to eq('1000.00')
      expect(transaction.credit).to eq('500.00')
      expect(transaction.debit).to eq(nil)
    end
  end

end
