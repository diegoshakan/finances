class Balance
  def initialize(options = {})
    @options = options
    @user = options[:user]
  end

  def payment_balance
    @user.payments.sum(&:value)
  end

  def payment_last_month
    last_payment = @user.payments.group_by { |m| m.date.beginning_of_month }
    sum_total = last_payment.values.last.sum(&:value) if last_payment.values.any?
    last_payment.keys.include?(Time.current.beginning_of_month) ? sum_total : 0.00
  end

  def receivable_balance
    @user.receivables.sum(&:value)
  end

  def receivable_last_month
    last_receivable = @user.receivables.group_by { |m| m.date.beginning_of_month }
    sum_total = last_receivable.values.last.sum(&:value) if last_receivable.values.any?
    last_receivable.keys.include?(Time.current.beginning_of_month) ? sum_total : 0.00
  end

  def total_balance
    receivable_balance - payment_balance
  end

  def total_balance_by_month
    receivable_last_month - payment_last_month
  end

  def total_balance_wallets
    @user.wallets.sum(&:value)
  end
end