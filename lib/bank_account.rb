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
    @transactions << Transaction.new(@balance, amount, nil)
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << Transaction.new(@balance, nil, amount)
    p @transactions
  end

  def print_statement
    statement = Statement.new(@transactions)
    p statement.header
  end
end
