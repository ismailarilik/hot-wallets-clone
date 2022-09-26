# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_error
  enum :context, income: 0, expense: 1, default: :income, suffix: true
end
