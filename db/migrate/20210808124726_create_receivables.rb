class CreateReceivables < ActiveRecord::Migration[6.1]
  def change
    create_table :receivables do |t|
      t.string :title
      t.text :description
      t.decimal :value
      t.date :date

      t.timestamps
    end
  end
end
