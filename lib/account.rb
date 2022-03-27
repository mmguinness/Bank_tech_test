class Account
  attr_reader :balance, :transaction, :history
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @transaction = { date: nil, credit: nil, debit: nil, balance: nil }
    @history = []
  end
  
  def credit(amount)
    @balance += amount
    interaction(amount)
  end

  def dedit(amount)
    @balance -= amount
  end

  private  

  def interaction(amount)
    @transaction[:credit] = amount
    @transaction[:date] = (Time.now).strftime('%m/%d/%Y')  
    @transaction[:balance] = @balance
    save_to_history
  end

  def save_to_history
    @history << @transaction
    @transaction = { date: nil, credit: nil, debit: nil, balance: nil }
  end

end
