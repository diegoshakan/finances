class SaveMoney < ApplicationRecord
  belongs_to :user

  default_scope { order(updated_at: :asc) }

  has_many :wallets, class_name: 'SaveMoneyWallet', dependent: :destroy

  accepts_nested_attributes_for :wallets, allow_destroy: true

  validates :title, presence: true
end
