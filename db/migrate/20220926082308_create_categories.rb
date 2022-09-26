# frozen_string_literal: true

# class CreateCategories < ActiveRecord::Migration[7.0]
class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :context
      t.string :icon

      t.timestamps
    end
  end
end
