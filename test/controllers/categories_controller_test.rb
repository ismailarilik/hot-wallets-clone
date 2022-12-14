# frozen_string_literal: true

require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @category = categories(:one)
    @user = users(:one)

    sign_in @user
  end

  teardown do
    sign_out @user
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    get new_category_url
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post(
        categories_url,
        params: { category: { context: @category.context, icon: @category.icon, name: @category.name } }
      )
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should show category' do
    get category_url(@category)
    assert_response :success
  end

  test 'should get edit' do
    get edit_category_url(@category)
    assert_response :success
  end

  test 'should update category' do
    patch(
      category_url(@category),
      params: { category: { context: @category.context, icon: @category.icon, name: @category.name } }
    )
    assert_redirected_to category_url(@category)
  end

  test 'should not destroy category because some transactions have strict dependency to it' do
    assert_difference('Category.count', 0) do
      delete category_url(@category)
    end

    assert_response :precondition_failed
  end
end
