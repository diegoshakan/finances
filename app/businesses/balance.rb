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

  def balance_by_month
    sum_last_month_receivables - sum_last_month_payments
  end

  def sum_last_month_receivables
    totals = @user.receivables.group(:date).sum(:value)
    @total_value = nil
    @last_month = sum_by_month_receivables.keys.last.strftime("%B")
    totals.each { |date, total| @total_value = total if date.strftime("%B") == @last_month }
    @total_value.to_f
  end

  def sum_last_month_payments
    totals = @user.payments.group(:date).sum(:value)
    @total_value = nil
    @last_month = sum_by_month_payments.keys.last.strftime("%B")
    totals.each { |date, total| @total_value = total if date.strftime("%B") == @last_month }
    @total_value.to_f
  end

  def sum_by_month_receivables
    @user.receivables.group(:date).sum(:value)
  end

  def sum_by_month_payments
    @user.payments.group(:date).sum(:value)
  end
end