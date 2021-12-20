class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receivables
  has_many :payments
  has_many :save_moneys
  has_many :wallets, class_name: 'SaveMoneyWallet', through: :save_moneys

  def receivable_balance
    ::Balance.new({ user: self }).receivable_balance
  end

  def payment_balance
    ::Balance.new({ user: self }).payment_balance
  end

  def total_balance
    ::Balance.new({ user: self }).total_balance
  end

  def sum_last_month_receivables
    ::Balance.new({ user: self }).sum_last_month_receivables
  end

  def sum_last_month_payments
    ::Balance.new({ user: self }).sum_last_month_payments
  end

  def balance_by_month
    ::Balance.new({ user: self }).balance_by_month
  end

  def sum_by_month_receivables
    ::Balance.new({ user: self }).sum_by_month_receivables
  end

  def sum_by_month_payments
    ::Balance.new({ user: self }).sum_by_month_payments
  end
end
