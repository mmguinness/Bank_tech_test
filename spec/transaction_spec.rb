require_relative '../lib/transaction'

describe Transaction do
  subject(:transaction) { described_class.new }

  before(:each) do
    time_stub = Time.new(2020, 1, 0o1, 0o1)
    allow(Time).to receive(:now).and_return(time_stub)
  end

  it 'adds the date to the transaction on creation' do
    expect(transaction.date).to eq('01/01/2020')
  end

  describe '#add_transaction_data' do
    it 'adds the transaction amount and current balance' do
      transaction.add_transaction_data(1000, 500, nil)
      expect(transaction.balance).to eq('1000.00')
      expect(transaction.credit).to eq('500.00')
      expect(transaction.debit).to eq(nil)
    end
  end
end
