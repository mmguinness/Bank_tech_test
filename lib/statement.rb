class Statement

  def inititalize 
    @text = []
  end

  def print_statement(account)
    format_statement(account)
    @text.each { |text| puts text }
  end

  private

  def format_statement(account)
    @text = []
    format_fields(account)
    @text.reverse!
    @text.unshift("date || credit || debit || balance")
  end

  def format_fields(account)
    account.history.each do |format|
      date = format[:date]
      credit = format[:credit]
      debit = format[:debit]
      balance = format[:balance]
      if credit != 0
        @text.push("#{date} || #{sprintf("%.2f", credit)} || || #{sprintf("%.2f", balance)}")
      elsif debit != 0
        @text.push("#{date} || || #{sprintf("%.2f", debit)} || #{sprintf("%.2f", balance)}")
      end
    end
  end
  
end
