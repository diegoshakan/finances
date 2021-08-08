class Receivable < ApplicationRecord
  belongs_to :user
  after_save :balance

  private

  def balance
    Balance.new({ receivables: self }).receivable_balance
  end
end
