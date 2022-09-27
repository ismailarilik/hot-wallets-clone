# frozen_string_literal: true

require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @transaction = transactions(:one)
    @user = users(:one)

    sign_in @user
  end

  teardown do
    sign_out @user
  end

  test 'should get index' do
    get transactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_transaction_url
    assert_response :success
  end

  test 'should create transaction' do
    assert_difference('Transaction.count') do
      post(
        transactions_url,
        params: {
          transaction: {
            category_id: @transaction.category_id,
            name: @transaction.name,
            price: @transaction.price,
            wallet_id: @transaction.wallet_id
          }
        }
      )
    end

    assert_redirected_to transaction_url(Transaction.last)
  end

  test 'should show transaction' do
    get transaction_url(@transaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_transaction_url(@transaction)
    assert_response :success
  end

  test 'should update transaction' do
    patch(
      transaction_url(@transaction),
      params: {
        transaction: {
          category_id: @transaction.category_id,
          name: @transaction.name,
          price: @transaction.price,
          wallet_id: @transaction.wallet_id
        }
      }
    )
    assert_redirected_to transaction_url(@transaction)
  end

  test 'should destroy transaction' do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction)
    end

    assert_redirected_to transactions_url
  end
end
