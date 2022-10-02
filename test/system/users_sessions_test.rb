# frozen_string_literal: true

require 'application_system_test_case'

class UsersSessionsTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'should create session' do
    # Root URL should redirect to new_user_session_url if no session is created before
    visit root_url

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    assert_text 'Signed in successfully'
  end

  test 'should destroy Session' do
    login_as(@user)
    visit root_url

    click_on 'Sign out'

    assert_text 'You need to sign in or sign up before continuing'
  end
end
