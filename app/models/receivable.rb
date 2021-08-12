class Receivable < ApplicationRecord
  belongs_to :user

  default_scope { order(date: :asc) }
end
