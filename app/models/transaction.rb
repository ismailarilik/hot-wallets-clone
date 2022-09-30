# frozen_string_literal: true

# class Transaction < ApplicationRecord
class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :wallet

  before_save :vectorize_price

  private

  # Income prices should be positive, expense prices should be negative
  def vectorize_price
    self.price = category.income? ? price.abs : -price.abs
  end
end
