class Statement
  attr_accessor :transactions

  def initialize(transactions) 
    @transactions = transactions
    @statement_body = []
  end

  def print_statement
    header
    body
  end

private 
  
  def header
    puts "date || credit || debit || balance"
  end

  def body
    format_body
    @statement_body.each do |print_transaction|
      puts print_transaction
    end
  end

  def format_body
    @transactions.each do |transaction|
      date = "30/03/2022"
      balance = sprintf("%.2f", transaction.balance)
      if transaction.credit != nil then credit = sprintf("%.2f", transaction.credit) end
      if transaction.debit != nil then debit = sprintf("%.2f", transaction.debit) end
      @statement_body.unshift("#{date} || #{credit} || #{debit} || #{balance}")
    end
  end

end
