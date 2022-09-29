# frozen_string_literal: true

require 'application_system_test_case'

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @transaction = transactions(:one)
    @user = users(:one)

    login_as(@user)
  end

  test 'visiting the index' do
    visit transactions_url
    assert_selector 'h1', text: 'Transactions'
  end

  test 'should create transaction' do
    visit transactions_url
    click_on 'New transaction'

    select(@transaction.category.name, from: 'Category')
    fill_in 'Name', with: @transaction.name
    fill_in 'Price', with: @transaction.price
    select(@transaction.wallet.name, from: 'Wallet')
    click_on 'Create Transaction'

    assert_text 'Transaction was successfully created'
    click_on 'Back'
  end

  test 'should update Transaction' do
    visit transaction_url(@transaction)
    click_on 'Edit this transaction', match: :first

    select(@transaction.category.name, from: 'Category')
    fill_in 'Name', with: @transaction.name
    fill_in 'Price', with: @transaction.price
    select(@transaction.wallet.name, from: 'Wallet')
    click_on 'Update Transaction'

    assert_text 'Transaction was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Transaction' do
    visit transaction_url(@transaction)
    click_on 'Destroy this transaction', match: :first

    assert_text 'Transaction was successfully destroyed'
  end
end
