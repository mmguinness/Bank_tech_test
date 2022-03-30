class Statement
  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def add_transactions(transactions)
    transactions.each do |transaction|
    @transactions.unshift(
      "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
      )
    end
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @transactions.each do |print_transaction|
      puts print_transaction
    end
  end

end
