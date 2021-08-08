class Payment < ApplicationRecord
  belongs_to :user

  def balance
    Balance.new({ payments: self }).payment_balance
  end
end
