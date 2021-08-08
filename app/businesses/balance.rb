class Balance
  def initialize(options = {})
    @options = options
    @payments = options[:payments]
    @receivables = options[:receivables]
  end

  def payment_balance
    @payments.sum(&:value)
  end

  def receivable_balance
    @receivables.sum(&:value)
  end

  def total_balance
    receivable_balance - payment_balance
  end
end