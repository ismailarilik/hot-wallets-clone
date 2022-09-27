# frozen_string_literal: true

# rubocop:disable Rails/NotNullColumn

# class AddUserRefToTransactions < ActiveRecord::Migration[7.0]
class AddUserRefToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :user, null: false, foreign_key: true
  end
end

# rubocop:enable Rails/NotNullColumn
