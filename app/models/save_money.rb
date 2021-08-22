class SaveMoney < ApplicationRecord
  belongs_to :user

  has_many :wallets, class_name: 'SaveMoneyWallet', dependent: :destroy

  accepts_nested_attributes_for :wallets, allow_destroy: true
end
