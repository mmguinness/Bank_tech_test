class Transaction
attr_reader :date, :balance, :credit, :debit

  def initialize(balance, credit, debit)
    # @date = Time.now.strftime('%d/%m/%Y')
    @balance = balance 
    @credit = credit
    @debit = debit
  end

end
