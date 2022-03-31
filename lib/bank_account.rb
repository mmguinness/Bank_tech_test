require_relative 'transaction'
require_relative 'statement'

class BankAccount
  attr_reader :transactions, :current_balance

  START_BALANCE = 0

  def initialize
    @current_balance = START_BALANCE
    @transactions = []
  end

  def deposit(amount, transaction = Transaction.new)
    @current_balance += amount
    transaction.add_transaction_data(@current_balance, amount, nil)
    @transactions << transaction
  end

  def withdraw(amount, transaction = Transaction.new)
    @current_balance -= amount
    transaction.add_transaction_data(@current_balance, nil, amount)
    @transactions << transaction
  end

  def create_statement(statement = Statement.new)
    statement.add_transactions(@transactions)
    statement.print_statement
  end
end
