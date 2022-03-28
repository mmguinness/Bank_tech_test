class Statement

  def inititalize 
    @text = []
  end

  def print_statement(account)
    format_statement(account)
    @text.reverse!
    @text.unshift("date || credit || debit || balance")
    @text.each { |text| puts text }
  end

  private

  def format_statement(account)
    array = []
    account.history.each do |format|
      date = format[:date]
      credit = format[:credit]
      debit = format[:debit]
      balance = format[:balance]
      if credit != 0
        array.push("#{date} || #{sprintf("%.2f", credit)} || || #{sprintf("%.2f", balance)}")
      elsif debit != 0
        array.push("#{date} || || #{sprintf("%.2f", debit)} || #{sprintf("%.2f", balance)}")
      end
    end
    @text = array
  end

end
