# frozen_string_literal: true

# rubocop:disable Rails/NotNullColumn

# class AddUserRefToCategories < ActiveRecord::Migration[7.0]
class AddUserRefToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, null: false, foreign_key: true
  end
end

# rubocop:enable Rails/NotNullColumn
