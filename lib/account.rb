class Account
  attr_reader :balance, :transaction, :history
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @transaction = {}
    @history = []
    @date = Time.now.strftime('%d/%m/%Y')
  end
  
  def credit(amount, date = @date)
    @balance += amount
    interaction('credit', amount, date)
  end

  def debit(amount, date = @date)
    @balance -= amount
    interaction('debit', amount, date)
  end

  private  

  def interaction(action, amount, date)
    action == 'credit' ? (@transaction[:credit] = amount) : (@transaction[:debit] = amount)
    @transaction[:date] = date
    @transaction[:balance] = @balance
    save_to_history
  end

  def save_to_history
    @history << @transaction
    @transaction = {}
  end

end
