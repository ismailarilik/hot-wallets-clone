# frozen_string_literal: true

require 'application_system_test_case'

class UsersRegistrationsTest < ApplicationSystemTestCase
  setup do
    @user = users(:two)
  end

  test 'should create registration' do
    visit new_user_registration_url

    fill_in 'Email', with: 'mucize@example.com'
    fill_in 'Password', match: :first, with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    click_on 'Sign up'

    assert_text 'Welcome! You have signed up successfully.'
  end

  test 'should update Registration' do
    login_as(@user)

    visit edit_user_registration_url

    fill_in 'Password', match: :first, with: '12345678'
    fill_in 'Password confirmation', with: '12345678'
    fill_in 'Current password', with: '12345678'
    click_on 'Update'

    assert_text 'Your account has been updated successfully'
  end

  test 'should destroy Registration' do
    login_as(@user)

    visit edit_user_registration_url

    click_on 'Cancel my account'

    assert_text 'You need to sign in or sign up before continuing'
  end
end
