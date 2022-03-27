class Account
  attr_reader :balance
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
  end
  
  def credit(amount)
    @balance += amount
  end

end