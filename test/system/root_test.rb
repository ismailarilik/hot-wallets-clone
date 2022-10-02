# frozen_string_literal: true

require 'application_system_test_case'

class RootTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)

    login_as(@user)
  end

  test 'visiting the index' do
    visit root_url
    assert_selector 'div#brand', text: 'HOTWallets'
    # Root page is the wallets page also
    assert_selector 'h1', text: 'Wallets'
  end
end
