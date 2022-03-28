class Statement

  def inititalize 
    @text = nil
  end

  def print_statement(account)
    format_statement(account)
    @text.gsub!(/\P{ASCII}/, '')
    puts @text
    return @text
  end

private

  def format_statement(account)
    date = account.history[0][:date]
    credit = account.history[0][:credit].round(2)
    balance = account.history[0][:balance]
    @text = "date || credit || balance
#{date} || #{sprintf("%.2f", credit)} || #{sprintf("%.2f", balance)}"
  end

end
