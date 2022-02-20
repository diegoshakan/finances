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

  def receivable_last_month
    ::Balance.new({ user: self }).receivable_last_month
  end

  def payment_balance
    ::Balance.new({ user: self }).payment_balance
  end

  def payment_last_month
    ::Balance.new({ user: self }).payment_last_month
  end

  def total_balance
    ::Balance.new({ user: self }).total_balance
  end

  def total_balance_by_month
    ::Balance.new({ user: self }).total_balance_by_month
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
