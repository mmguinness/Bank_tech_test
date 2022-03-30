require_relative 'transaction'
require_relative 'statement'

class BankAccount
  attr_reader :transactions, :balance
  START_BALANCE = 0

  def initialize
    @balance = START_BALANCE
    @transactions = []
  end

  def deposit(amount, transaction = Transaction.new)
    @balance += amount
    transaction.save_info(@balance, amount, nil)
    @transactions << transaction
  end

  def withdraw(amount, transaction = Transaction.new)
    @balance -= amount
    transaction.save_info(@balance, nil, amount)
    @transactions << transaction
  end

  def statement(statement = Statement.new)
    statement.add_transactions(@transactions)
    statement.print_statement
  end
  
end
