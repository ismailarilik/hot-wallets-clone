# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
end
