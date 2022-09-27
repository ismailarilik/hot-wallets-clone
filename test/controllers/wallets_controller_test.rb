# frozen_string_literal: true

require 'test_helper'

class WalletsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @wallet = wallets(:one)
    @user = users(:one)

    sign_in @user
  end

  teardown do
    sign_out @user
  end

  test 'should get index' do
    get wallets_url
    assert_response :success
  end

  test 'should get new' do
    get new_wallet_url
    assert_response :success
  end

  test 'should create wallet' do
    assert_difference('Wallet.count') do
      post wallets_url, params: { wallet: { name: @wallet.name } }
    end

    assert_redirected_to wallet_url(Wallet.last)
  end

  test 'should show wallet' do
    get wallet_url(@wallet)
    assert_response :success
  end

  test 'should get edit' do
    get edit_wallet_url(@wallet)
    assert_response :success
  end

  test 'should update wallet' do
    patch wallet_url(@wallet), params: { wallet: { name: @wallet.name } }
    assert_redirected_to wallet_url(@wallet)
  end

  test 'should destroy wallet' do
    assert_difference('Wallet.count', -1) do
      delete wallet_url(@wallet)
    end

    assert_redirected_to wallets_url
  end
end
