class Statement
  attr_accessor :transactions

  def initialize
    @transactions = []
  end

  def add_transactions(transactions)
    transactions.each do |input|
      @transactions.unshift("#{input.date} || #{input.credit} || #{input.debit} || #{input.balance}")
    end
  end

  def print_statement
    puts 'date || credit || debit || balance'
    @transactions.each do |transaction_data|
      puts transaction_data
    end
  end
end
