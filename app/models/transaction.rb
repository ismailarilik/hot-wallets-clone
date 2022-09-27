# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :wallet
end
