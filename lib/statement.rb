class Statement
  attr_accessor :transactions

  def initialize
    @transactions = []
    @statement_body = []
  end

  def add_transactions(transactions)
    @transactions = transactions
    format_body
  end

  def format_body
    @transactions.each do |transaction|
      date = '30/03/2022'
      balance = sprintf('%.2f', transaction.balance)
      if transaction.credit != nil then credit = sprintf('%.2f', transaction.credit) end
      if transaction.debit != nil then debit = sprintf('%.2f', transaction.debit) end
      @statement_body.unshift("#{date} || #{credit} || #{debit} || #{balance}")
    end
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @statement_body.each do |print_transaction|
      puts print_transaction
    end
  end

end
