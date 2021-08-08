class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :receivables
  has_many :payments

  def receivable_balance
    ::Balance.new({ user: self }).receivable_balance
  end

  def payment_balance
    ::Balance.new({ user: self }).payment_balance
  end

  def total_balance
    ::Balance.new({ user: self }).total_balance
  end
end
