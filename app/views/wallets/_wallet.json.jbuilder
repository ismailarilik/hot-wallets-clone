# frozen_string_literal: true

json.extract! wallet, :id, :name, :created_at, :updated_at
json.url wallet_url(wallet, format: :json)
