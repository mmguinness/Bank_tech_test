class Account
  attr_reader :balance, :transaction, :history
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @transaction = { }
    @history = []
  end
  
  def credit(amount)
    @balance += amount
    interaction('credit', amount)
  end

  def dedit(amount)
    @balance -= amount
    interaction('debit', amount)
  end

  private  

  def interaction(action, amount)
    action == 'credit' ? (@transaction[:credit] = amount) : (@transaction[:debit] = amount)
    @transaction[:date] = (Time.now).strftime('%m/%d/%Y')  
    @transaction[:balance] = @balance
    save_to_history
  end

  def save_to_history
    @history << @transaction
    @transaction = { }
  end

end
