# frozen_string_literal: true

# class CreateWallets < ActiveRecord::Migration[7.0]
class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.string :name

      t.timestamps
    end
  end
end
