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

    it 'records the transaction with details of amount credited, date and new balance' do
      account.credit(1000)
      expect(account.history[0]).to eq({ :date=>"03/27/2022", :credit=>1000, :balance=>1000 })
    end

  end

  describe '#debit' do
    it 'removes specified amount from the account balance' do
      account.credit(1000)
      account.debit(500)
      expect(account.balance).to eq(500)
    end

    it 'records the transaction with details of amount debited, date and new balance' do
      account.credit(1000)
      account.debit(500)
      expect(account.history[1]).to eq({ :date=>"03/27/2022", :debit=>500, :balance=>500 })
    end
  end

end
