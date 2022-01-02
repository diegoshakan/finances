class Balance
  def initialize(options = {})
    @options = options
    @user = options[:user]
  end

  def payment_balance
    @user.payments.sum(&:value)
  end

  def payment_last_month
    last_payment = @user.payments.group(:date).sum(:value)
    last_payment.values.last.to_f
  end

  def receivable_balance
    @user.receivables.sum(&:value)
  end

  def receivable_last_month
    last_receivable = @user.receivables.group(:date).sum(:value)
    last_receivable.values.last.to_f
  end

  def total_balance
    receivable_balance - payment_balance
  end

  def total_balance_by_month
    receivable_last_month - payment_last_month
  end
end