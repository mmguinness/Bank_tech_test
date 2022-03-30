class Transaction
attr_reader :date, :balance, :credit, :debit

  def initialize
    @date = Time.now.strftime('%d/%m/%Y')
    @balance = nil 
    @credit = nil
    @debit = nil
  end

  def save_transaction(balance, credit, debit)
    @balance = balance 
    @credit = credit
    @debit = debit
    format_transaction
  end

  def format_transaction
    @balance = sprintf('%.2f', @balance)
    if @credit != nil then @credit = sprintf('%.2f', @credit) end
    if @debit != nil then @debit = sprintf('%.2f', @debit) end
  end

end
