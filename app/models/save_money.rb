class SaveMoney < ApplicationRecord
  belongs_to :user

  has_many :wallets, class_name: 'SaveMoneyWallet', dependent: :destroy

  accepts_nested_attributes_for :wallets, allow_destroy: true

  validates :title, presence: true

  def total_by_wallet
    ::SaveMoneys::Balance.new({ save_money: self }).call
  end
end
