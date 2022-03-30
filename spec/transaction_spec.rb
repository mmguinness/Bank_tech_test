require_relative '../lib/transaction'

describe Transaction do
  subject(:transaction) { described_class.new }

  describe '#save_info' do
    it 'stores the balance and value and date of transaction' do
      transaction.save_transaction(1000, 500, nil)
      expect(transaction.balance).to eq('1000.00')
      expect(transaction.credit).to eq('500.00')
      expect(transaction.debit).to eq(nil)
      expect(transaction.date).to eq("30/03/2022")
    end
  end

end
