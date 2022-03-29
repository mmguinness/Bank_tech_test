class Transaction
  attr_reader :balance, :history
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @history = []
  end
  
  def credit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @balance += amount
    transaction('credit', amount, date)
  end

  def debit(amount, date = Time.now.strftime('%d/%m/%Y'))
    @balance -= amount
    transaction('debit', amount, date)
  end

  private  

  def transaction(action, amount, date)
    record = {}
    action == 'credit' ? (record[:credit] = amount) : (record[:credit] = 0)
    action == 'debit' ? (record[:debit] = amount) : (record[:debit] = 0)
    record[:date] = date
    record[:balance] = @balance
    @history << record
  end

end
