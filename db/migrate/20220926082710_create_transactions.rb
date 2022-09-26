# frozen_string_literal: true

# class CreateTransactions < ActiveRecord::Migration[7.0]
class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.references :category, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
