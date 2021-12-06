class SaveMoneyWallet < ApplicationRecord
  belongs_to :save_money

  validates :title, :value, :date, presence: true
end
