class Balance
  def initialize(options = {})
    @options = options
    @user = options[:user]
  end

  def payment_balance
    @user.payments.sum(&:value)
  end

  def receivable_balance
    @user.receivables.sum(&:value)
  end

  def total_balance
    receivable_balance - payment_balance
  end
end