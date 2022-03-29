require_relative 'transaction'
require_relative 'statement'

class BankAccount

  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def store_account(account)
    @accounts << account
  end

  def deposit(account, amount, date = Time.now.strftime('%d/%m/%Y'))
    account.credit(amount, date)
  end

  def withdraw(account, amount, date = Time.now.strftime('%d/%m/%Y'))
    account.debit(amount, date)
  end

  def create_statement(account)
    Statement.new.print_statement(account)
  end

end