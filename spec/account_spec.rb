require_relative '../lib/account'

describe Account do
  subject(:account) { described_class.new }

  it 'has zero balance when created' do
    expect(account.balance).to eq(0)
  end

  describe '#credit' do
    it 'adds specified amount to the account balance' do
      account.credit(1000)
      expect(account.balance).to eq(1000)
    end

    it 'records the transaction details of amount added, todays date and the new balance' do
      time_stub = Time.new(2020, 1, 0o1, 0o1)
      allow(Time).to receive(:now).and_return(time_stub)
      account.credit(1000)
      expect(account.history[0]).to eq({ :date => "01/01/2020", :credit => 1000, :debit => 0, :balance => 1000 })
    end

    it 'records the transaction details with specific date, if provided' do
      account.credit(1000, "01/04/2022")
      expect(account.history[0]).to eq({ :date => "01/04/2022", :credit => 1000, :debit => 0, :balance => 1000 })
    end
  end

  describe '#debit' do
    it 'removes specified amount from the account balance' do
      account.credit(1000)
      account.debit(500)
      expect(account.balance).to eq(500)
    end

    it 'records the transaction details of amount debited, todays date and new balance' do
      time_stub = Time.new(2020, 1, 0o1, 0o1)
      allow(Time).to receive(:now).and_return(time_stub)
      account.credit(1000)
      account.debit(500)
      expect(account.history[1]).to eq({ :date => "01/01/2020", :credit => 0, :debit => 500, :balance => 500 })
    end
  end

end
