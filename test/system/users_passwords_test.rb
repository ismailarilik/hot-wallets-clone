# frozen_string_literal: true

require 'application_system_test_case'

class UsersPasswordsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'should create password' do
    visit new_user_password_url

    fill_in 'Email', with: @user.email
    click_on 'Send me reset password instructions'

    assert_text 'You will receive an email with instructions on how to reset your password in a few minutes'
  end
end
