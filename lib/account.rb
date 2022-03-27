class Account
  attr_reader :balance, :transaction, :history
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @transaction = { date: "03/27/2022" }
    @history = []
  end
  
  def credit(amount, date="03/27/2022")
    @balance += amount
    interaction('credit', amount, date)
  end

  def debit(amount, date="03/27/2022")
    @balance -= amount
    interaction('debit', amount, date)
  end

  private  

  def interaction(action, amount, date)
    action == 'credit' ? (@transaction[:credit] = amount) : (@transaction[:debit] = amount)
    provide_date(date)
    @transaction[:balance] = @balance
    save_to_history
  end
  
  def provide_date(date)
    if date != "03/27/2022" then @transaction[:date] = (Time.now).strftime('%m/%d/%Y') end
  end
  
  def save_to_history
    @history << @transaction
    @transaction = { date: "03/27/2022" }
  end

end
