class Transaction

  def initialize(value, current_balance, type)
    @date = Time.now.strftime('%d/%m/%Y')
    @value = value
    @current_balance = current_balance
    @type = type
  end

end
