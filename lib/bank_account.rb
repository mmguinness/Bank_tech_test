require_relative 'transaction'
require_relative 'statement'

class BankAccount

  attr_reader :transactions, :balance
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << Transaction.new(amount, @balance, 'credit')
  end

  def withdraw(transaction, amount, date = Time.now.strftime('%d/%m/%Y'))
    transaction.debit(amount, date)
  end

  def create_statement(transaction)
    Statement.new.print_statement(transaction)
  end

end
