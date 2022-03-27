class Bank

  attr_reader :accounts

  def initialize
    @accounts = []
  end

  def create_account(account_name)
    @accounts << account_name = Account.new
  end

end
