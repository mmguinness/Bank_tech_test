class Transaction
  attr_reader :date, :balance, :credit, :debit

  def initialize(date = Time.now.strftime('%d/%m/%Y'))
    @date = date
    @balance = nil
    @credit = nil
    @debit = nil
  end

  def add_transaction_data(balance, credit, debit)
    @balance = balance
    @credit = credit
    @debit = debit
    format_transaction_data
  end

  private

  def format_transaction_data
    @balance = format('%.2f', @balance)
    !@credit.nil? ? (@credit = format('%.2f', @credit)) : (@debit = format('%.2f', @debit))
  end
end
