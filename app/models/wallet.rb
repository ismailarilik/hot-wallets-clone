# frozen_string_literal: true

class Wallet < ApplicationRecord
  has_many :transactions, dependent: :destroy
end
