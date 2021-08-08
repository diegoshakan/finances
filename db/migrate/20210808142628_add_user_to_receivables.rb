class AddUserToReceivables < ActiveRecord::Migration[6.1]
  def change
    add_reference :receivables, :user, null: false, foreign_key: true
  end
end
