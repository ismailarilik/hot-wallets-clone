# frozen_string_literal: true

# rubocop:disable Rails/NotNullColumn

# class AddUserRefToWallets < ActiveRecord::Migration[7.0]
class AddUserRefToWallets < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallets, :user, null: false, foreign_key: true
  end
end

# rubocop:enable Rails/NotNullColumn
