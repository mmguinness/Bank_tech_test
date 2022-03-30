class Transaction
attr_reader :date, :balance, :credit, :debit

  def initialize
    @date = "30/03/2022"
    # @date = Time.now.strftime('%d/%m/%Y')
    @balance = nil 
    @credit = nil
    @debit = nil
  end

  def save_info(balance, credit, debit)
    @balance = balance 
    @credit = credit
    @debit = debit
  end

end
