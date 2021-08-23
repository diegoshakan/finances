class CreateSaveMoneyWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :save_money_wallets do |t|
      t.string :title
      t.text :description
      t.decimal :value
      t.date :date
      t.references :save_money, null: false, foreign_key: true

      t.timestamps
    end
  end
end
