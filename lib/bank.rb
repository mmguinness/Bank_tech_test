require_relative 'account'

class Bank

  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def store_account(account)
    @accounts << account
  end

  def deposit(account, amount)
    account.credit(amount)
  end

  def withdraw(account, amount)
    account.debit(amount)
  end

end
